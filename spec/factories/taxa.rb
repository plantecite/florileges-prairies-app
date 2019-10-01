# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :taxon do
    regne { "MyText" }
    phylum { "MyText" }
    classe { "MyText" }
    ordre { "MyText" }
    famille { "MyText" }
    group1_inpn { "MyText" }
    group2_inpn { "MyText" }
    cd_nom { 1 }
    cd_taxsup { 1 }
    cd_ref { 1 }
    rang { "MyString" }
    lb_nom { "MyText" }
    lb_auteur { "MyText" }
    nom_complet { "MyText" }
    nom_complet_html { "MyText" }
    nom_valide { "MyText" }
    nom_vern { "MyText" }
    nom_vern_eng { "MyText" }
    habitat { "MyString" }
    fr { "MyString" }
    gf { "MyString" }
    mar { "MyString" }
    gua { "MyString" }
    sm { "MyString" }
    sb { "MyString" }
    spm { "MyString" }
    may { "MyString" }
    epa { "MyString" }
    reu { "MyString" }
    taaf { "MyString" }
    pf { "MyString" }
    nc { "MyString" }
    wf { "MyString" }
    cli { "MyString" }
    url { "MyString" }
    taxref_v { 1 }
    florileges { false }
  end
end
