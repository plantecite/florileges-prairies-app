class AdminDataExporterService
  attr_reader :user, :workbook, :attachment, :message, :error, :admin_request

  def initialize(user_id)
    @user = User.find user_id
    @is_admin_request = @user.has_role? :admin
    @workbook = nil
    @attachment = nil
    @message = ""
    @error = nil
    @tmp_path = "#{Rails.root.to_s}/tmp/exports"
    puts @tmp_path
    FileUtils::mkdir_p @tmp_path
  end

  def call()
    puts "Processing Admin Exporter Service"
    @workbook = FastExcel.open(constant_memory: true)
    bold = @workbook.bold_cell_format
    @sites = Site.all

    # SITES
    sites_worksheet = @workbook.add_worksheet("Sites")
    sites_worksheet.write_row(0, [
      "site_id",
      "site_code",
      "site_latitude",
      "site_longitude",
      "site_location",
      "site_frequentation",
      "site_gestionnaire",
      "site_surface",
      "site_objectifs",
      "site_date_creation",
      "site_ancien_usage",
      "site_hist_trav",
      "site_amendement",
      "site_amendement_freq",
      "site_travaux",
      "site_travaux_freq",
      "site_propage",
      "id_PROPAGE",
    ], bold)
    i = 1

    raise "Unauthorized request" unless @is_admin_request

    if @is_admin_request
      Site.all.find_each(batch_size: 300) do |site|
        sites_worksheet.write_row(i, [
          site.id,
          site.code,
          site.latitude,
          site.longitude,
          site.location,
          site.gen_freq,
          site.gen_gest,
          site.gen_surface,
          site.gen_obj.to_s.split("|"),
          site.hist_date,
          site.hist_occsol,
          site.hist_trav,
          site.cult_amend,
          site.cult_amend_freq,
          site.cult_trav,
          site.cult_trav_freq,
          site.propage,
          site.propage_identifier,
        ])
        i += 1
      end
    else
      raise @error = "Vous n'êtes pas authorisé-e à réaliser cette action"
    end

    # OBSERVATIONS
    observations_worksheet = @workbook.add_worksheet("Observations")
    observations_worksheet.write_row(0, [
      "obs_id",
      "site_id",
      # "site_code",
      "releve_date",
      "releve_nom",
      "releve_structure",
      # "releve_referents_email",
      "releve_time_start",
      "releve_time_end",
      "releve_hauteur",
      "releve_milieux",
      "releve_semis",
      "releve_fauche",
      "releve_fauche_periode",
      "releve_fauche_freq",
      "releve_fauche_export",
      "releve_paturage",
      "releve_paturage_pression",
      "releve_paturage_duree",
      "releve_traitement",
      "releve_pression",
      "obs_LB_NOM",
      "obs_NOM_VALIDE",
      "obs_CD_NOM",
      "obs_CD_REF",
      "obs_florileges_liste",
      "obs_TAXREF_V",
      "obs_q1",
      "obs_q2",
      "obs_q3",
      "obs_q4",
      "obs_q5",
      "obs_q6",
      "obs_q7",
      "obs_q8",
      "obs_q9",
      "obs_q10",
      "obs_hors_q",
    ])
    j = 1
    if @is_admin_request
      Observation.find_each(:batch_size => 300) do |observation|
        if observation.releve.present? & observation.taxon.present?
          observations_worksheet.write_row(j, [
            observation.id,
            observation.releve.site_id,
            # observation.releve.site.code,
            observation.releve.date,
            observation.releve.name,
            observation.releve.structure,
            # observation.releve.site.users.map { |u| "#{u.email}" }.join("|"),
            observation.releve.time_start.to_s.gsub("01/01/2000 ", ""),
            observation.releve.time_end.to_s.gsub("01/01/2000 ", ""),
            observation.releve.hauteur,
            observation.releve.milieux.split("|"),
            observation.releve.semis,
            observation.releve.fauche,
            observation.releve.fauche_periode,
            observation.releve.fauche_freq,
            observation.releve.fauche_export,
            observation.releve.paturage,
            observation.releve.paturage_pression,
            observation.releve.paturage_duree,
            observation.releve.traitement,
            observation.releve.pression,
            observation.taxon.lb_nom,
            observation.taxon.nom_valide,
            observation.taxon.cd_nom,
            observation.taxon.cd_ref,
            observation.taxon.florileges,
            "v8.0",
            observation.q1,
            observation.q2,
            observation.q3,
            observation.q4,
            observation.q5,
            observation.q6,
            observation.q7,
            observation.q8,
            observation.q9,
            observation.q10,
            observation.q0,
          ])
          j += 1
        end
      end
    else
      raise @error = "Vous n'êtes pas authorisé-e à réaliser cette action"
    end

    if @is_admin_request
      @message = "L'export de toutes les données d'observations est en cours d'assemblage."
    else
      @message = "Impossible de réaliser cette action."
    end

    @workbook.close
    content = @workbook.read_string
    filename = "florileges-prairies-export-#{Time.now.strftime("%Y%m%d%H%M%S")}.xlsx"
    File.open("#{@tmp_path}/#{filename}", "wb") { |f| f.write(content) }
    @attachment = OpenStruct.new(:name => filename, :path => "#{@tmp_path}/#{filename}")
  end

  # def example
  #   @workbook = FastExcel.open(constant_memory: true)
  #   worksheet = @workbook.add_worksheet("Observations")

  #   for i in 0..5
  #     for n in 0..3
  #       worksheet.write_number(i, n, (i + 1) * (n + 1), nil)
  #     end
  #   end

  #   chart = @workbook.add_chart(Libxlsxwriter::enum_type(:chart_type)[:column])

  #   chart.add_series("Bob", "Observations!$A$1:$A$5")
  #   chart.add_series("Alice", "Observations!$B$1:$B$5")
  #   chart.add_series("Montgomery", "Observations!$C$1:$C$5")

  #   worksheet.insert_chart(1, 7, chart)

  #   @workbook.close
  #   content = @workbook.read_string
  # end
end
