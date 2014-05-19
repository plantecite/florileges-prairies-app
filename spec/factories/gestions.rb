# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gestion do
    gestion_date "2014-05-13"
    gen_prop "MyString"
    gen_gest "MyString"
    gen_struct "MyString"
    gen_surface 1
    gen_obj "MyString"
    gen_freq "MyString"
    hist_occsol "MyString"
    hist_date "MyString"
    hist_trav "MyString"
    hist_trav_info "MyText"
    hist_desc "MyText"
    hist_desc_date "MyString"
    it_trav "MyString"
    it_trav_freq "MyString"
    it_trav_freq_reginfo "MyString"
    it_amend "MyString"
    it_amend_freq "MyString"
    it_amend_freq_reginfo "MyString"
    it_gestion "MyString"
    it_pat_nb 1
    it_pat_duree "MyString"
    it_f_cal_prev "MyString"
    it_f_cal_current "MyString"
    it_p_cal_prev "MyString"
    it_p_cal_current "MyString"
    it_f_export false
    it_phyto false
    it_phyto_info "MyString"
    it_pression "MyString"
    scp_info false
    scp_desc "MyText"
    site nil
  end
end
