# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :espece do
    taxref 1
    bdtfx 1
    famille "MyString"
    nom_sci "MyString"
    auteur "MyString"
    annee 1
    nom_sci_complet "MyString"
    nom_vern "MyString"
    avatar "MyString"
    reconnaissance "MyText"
    confusion "MyText"
    habitat_desc "MyText"
    faune "MyText"
    flo_s "MyString"
    flo_i 1
    indic_pel 1
    indic_pra 1
    indic_fri 1
    tol_fau 1
    tol_pat 1
    tol_pie 1
    off_nec 1
    off_pol 1
    pollen "MyString"
    hauteur 1
  end
end
