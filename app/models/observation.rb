class Observation < ActiveRecord::Base
  belongs_to :releve

  belongs_to :taxon

  # ---- CALLBACKS ----
  after_touch :sync_site_id_cache

  private

  def sync_site_id_cache
    @owner_cache = nil
    @site_cache = nil
    if releve.present?
      if releve.site.present?
        site_cache = releve.site.id
        if releve.site.users.any?
          owner_cache = releve.site.users.first.id
        end
      end
    end

    update_attributes(
      site_owner_id_cache: owner_cache,
      site_id_cache: site_cache,
    )
    puts "Observation##{id} was touched"
  end
end
