

essential_col <- c("calc.region","calc.district","finalsettlment")



#select multiple columns variables and change the 0 to no and 1 to yes to be used in the no consensus stage later
select_multiple<- butteR::auto_detect_select_multiple(df)
select_multiple_df<- select(df,calc.region,calc.district,finalsettlment, contains(select_multiple))
select_multiple_df[select_multiple_df==0]<- "no"
select_multiple_df[select_multiple_df==1]<- "yes"



select_multile_col <-c("available_health_services.none", "available_health_services.mobile_clinic",
  "available_health_services.hospital", "available_health_services.first_aid",
  "available_health_services.clinic", "available_health_services.other",
  "available_health_services.midwife", "available_health_services.dontknow",
  "available_health_services.healer", "available_health_services.individual_pract",
  "available_health_services.drugstore","barriers_health.distance",
  "barriers_health.none", "barriers_health.cost_services", "barriers_health.absence_personnel",
  "barriers_health.other", "barriers_health.dontknow", "barriers_health.security",
  "barriers_usetoilets.too_far",
  "barriers_usetoilets.women_notsafe", "barriers_usetoilets.too_dirty",
  "barriers_usetoilets.not_available", "barriers_usetoilets.overcrowded",
  "barriers_usetoilets.pwd_notsafe", "barriers_usetoilets.night_notsafe",
  "barriers_usetoilets.not_funtional", "barriers_usetoilets.dontknow",
  "barriers_usetoilets.insufficient", "barriers_usetoilets.not_common",
  "barriers_usetoilets.other", "barriers_usetoilets.child_notsafe",
   "conflict_causes.tax_dispute", "conflict_causes.none",
  "conflict_causes.shelter_dispute", "conflict_causes.food_dispute",
  "conflict_causes.land_dispute", "conflict_causes.tohumanitarianaid",
  "conflict_causes.clan_dispute", "conflict_causes.other", "conflict_causes.livestock_dispute",
  "conflict_causes.water_dispute", "conflict_causes.property_dispute",
  "conflict_causes.dontknow", "conflict_causes.access_work", "conflict_causes.noresponse",
  "conflict_causes.family_dispute",  "conflict_mediators.clan_lead",
  "conflict_mediators.gatekeeper", "conflict_mediators.none", "conflict_mediators.loc_authorities",
  "conflict_mediators.rel_leader", "conflict_mediators.health_staff",
  "conflict_mediators.ngo_staff", "conflict_mediators.other", "conflict_mediators.commun_leader_elder",
  "conflict_mediators.dontknow", "conflict_mediators.noresponse",
  "coping_food_strat.none", "coping_food_strat.limit_portions",
  "coping_food_strat.wild_foods", "coping_food_strat.part_skips",
  "coping_food_strat.borrow", "coping_food_strat.cheaper_food",
  "coping_food_strat.dontknow", "coping_food_strat.other", "coping_food_strat.reduce_portions",
  "coping_food_strat.skip_days", "coping_food_strat.noresponse",
  "education_available.none", "education_available.secon_girls",
  "education_available.secon_boys", "education_available.ngoschool",
  "education_available.basic_boys", "education_available.quran_boys",
  "education_available.basic_girls", "education_available.prim_girls",
  "education_available.other", "education_available.prim_boys",
  "education_available.dontknow", "education_available.quran_girls",
  "idp_arrived_reason.lack_jobs", "idp_arrived_reason.no_services",
  "idp_arrived_reason.evictions", "idp_arrived_reason.noresponse",
  "idp_arrived_reason.dontknow", "idp_arrived_reason.drought",
  "idp_arrived_reason.flooding", "idp_arrived_reason.other", "idp_arrived_reason.conflict",
   "idp_pull_factors.better_security", "idp_pull_factors.noresponse",
  "idp_pull_factors.better_services", "idp_pull_factors.presence_jobs",
  "idp_pull_factors.availability_shelters", "idp_pull_factors.other",
  "idp_pull_factors.access_water", "idp_pull_factors.dontknow",
  "idp_pull_factors.access_food",
  "incidents_wh_leaving.loss_property",
  "incidents_wh_leaving.none", "incidents_wh_leaving.family_separation",
  "incidents_wh_leaving.killing", "incidents_wh_leaving.tax_toleave",
  "incidents_wh_leaving.other", "incidents_wh_leaving.sexual_violence",
  "incidents_wh_leaving.dontknow", "incidents_wh_leaving.injury",
  "incidents_wh_leaving.relatives_targeted", "incidents_wh_leaving.noresponse",
  "info_barriers.written_info_illiterate", "info_barriers.none",
  "info_barriers.lack_mobile", "info_barriers.no_credit", "info_barriers.other",
  "info_barriers.dontknow", "info_barriers.lack_electricity", "info_barriers.lack_radio_sign",
   "info_mainsource.phone_calls", "info_mainsource.conversations",
  "info_mainsource.sms", "info_mainsource.other", "info_mainsource.social_media",
  "info_mainsource.internet", "info_mainsource.dontknow", "info_mainsource.radio",
  "info_mainsource.noresponse", "lack_food_reasons.noland",
  "lack_food_reasons.nomarket", "lack_food_reasons.natural_causes",
  "lack_food_reasons.other", "lack_food_reasons.economic_causes",
  "lack_food_reasons.dontknow", "lack_food_reasons.security", 
  
  "livelihood_activ.money_rent", "livelihood_activ.remittances",
  "livelihood_activ.none", "livelihood_activ.business", "livelihood_activ.contractual_work",
  "livelihood_activ.begging", "livelihood_activ.livestock_produce",
  "livelihood_activ.other", "livelihood_activ.humanitar_assistance",
  "livelihood_activ.dontknow", "livelihood_activ.day_labour", "livelihood_activ.farming",
   "main_radios.radio_simba", "main_radios.none",
  "main_radios.radio_xamar", "main_radios.al_furqaan", "main_radios.radio_banadir",
  "main_radios.al_andalus", "main_radios.bar_kulan", "main_radios.africas_voices",
  "main_radios.other", "main_radios.voice_of_america", "main_radios.radio_shabelle",
  "main_radios.radio_xurmo", "main_radios.al_risaala", "main_radios.dontknow",
  "main_radios.radio_ergo", "main_radios.star_fm", "main_radios.bbc_somalia",
  "main_radios.radio_kulmiye", "main_radios.radio_mogadishu", 
   "market_goods.clothes_sewing", "market_goods.tools_seeds",
  "market_goods.livestock", "market_goods.food", "market_goods.jerry_cans",
  "market_goods.construction_materials", "market_goods.mosquito_nets",
  "market_goods.womens_materials", "market_goods.fuel_cooking",
  "market_goods.dontknow", "market_goods.soap", "market_goods.shoes",
  "ngo_support_type.livestock" ,"ngo_support_type.cash_distrib","ngo_support_type.seeds_tools"   ,
  "ngo_support_type.other" ,"ngo_support_type.vaccinations" ,"ngo_support_type.dontknow",
  "ngo_support_type.food_distrib"   , "ngo_support_type.education_service","ngo_support_type.construction_materials_nfis","ngo_support_type.legal_support",
  "noaccess_health.none", "noaccess_health.m_over60",
  "noaccess_health.m_over18", "noaccess_health.g_under18", "noaccess_health.pwd",
  "noaccess_health.other", "noaccess_health.dontknow", "noaccess_health.b_under18",
  "noaccess_health.w_over60", "noaccess_health.w_over18",
  "nomarket_why.market_far", "nomarket_why.other", "nomarket_why.no_items",
  "nomarket_why.dontknow", "nomarket_why.security", "nomarket_why.bad_quality",
  "nomarket_why.no_cash", "protection_inc_location.human_aid_distr",
  "protection_inc_location.school", "protection_inc_location.shelters",
  "protection_inc_location.bathing_pl", "protection_inc_location.checkpoint",
  "protection_inc_location.dontknow", "protection_inc_location.clinic",
  "protection_inc_location.on_the_road", "protection_inc_location.latrines",
  "protection_inc_location.near_water", "protection_inc_location.in_field",
  "protection_inc_location.other", "protection_inc_location.market",
  "protection_incidents.none", "protection_incidents.tax_collection",
  "protection_incidents.dontknow", "protection_incidents.other",
  "protection_incidents.sexual_violence", "protection_incidents.theft",
  "protection_incidents.abduction", "protection_incidents.uxo",
  "protection_incidents.conflict_in_set", "protection_incidents.conflict_other_settlement",
  "protection_incidents.noresponse", "nomarket_why.road_closed", 
  "nomarket_why.concern_transmiting", "sources_covid_informaiton.ngos_NGOs", "sources_covid_informaiton.traditional_healers", 
  "sources_covid_informaiton.socail_media", "sources_covid_informaiton.drugstore_Drugstore", 
  "sources_covid_informaiton.family_friends", "sources_covid_informaiton.media_radio_tv", 
  "sources_covid_informaiton.local_leaders", "sources_covid_informaiton.other_specify", 
  "sources_covid_informaiton.religious_leaders", "sources_covid_informaiton.government_agencies", 
  "sources_covid_informaiton.healthcare_workers", "sources_covid_informaiton.don.t_know" , "covid_measures.no_measure_taken", 
  "covid_measures.washing_soap", "covid_measures.avoid_markets", 
  "covid_measures.not_allow_people_in", "covid_measures.old_people_move", 
  "covid_measures.using_sanitizers", "covid_measures.wearing_masks", 
  "covid_measures.pray", "covid_measures.washing_water", "covid_measures.other", 
  "covid_measures.dontknow", "covid_measures.isolate_people_with_syspthoms", 
  "covid_measures.keeping_people"
)


not_needed_columns <- c( "start", "end","today", "deviceid", "available_health_services","barriers_health", "barriers_usetoilets",
                        "conflict_causes","conflict_mediators","coping_food_strat","education_available",
                        "idp_arrived_reason", "idp_pull_factors", "incidents_wh_leaving","info_barriers", "info_mainsource", "lack_food_reasons",
                        "left_behind_who", "livelihood_activ", "main_radios", "market_goods", "ngo_support_type","noaccess_health","nomarket_why","nomarket_why_short",
                        "protection_inc_location", "protection_incidents","enum_code_baidoa","contact_again", "end_note", "X__version__", "X_id", "X_uuid",
                        "X_submission_time", "X_index", "X.1", "idp_site", "info_reg", "district_info", "gender_ki", 
                        "MERGED_FROM_FILE", "X", "enum_code_mogadishu", "idpsite_district", 
                        "h2r_notice", "hc_push_second_other", "info_personsource_other", 
                        "ngo_support_type.none", "enum_code_hargeisa", "KI_settlem_type", 
                        "idpsite_name", "info_settlement_001", "X_version_", "X_version__001", "noaccess_health_other", "how_often_provide_health", "protection_incidents_other", 
                        "education_bar_girls_other", "ngo_support_type_other", 
                        "sources_covid_informaiton", "other_covid_info_sources", "covid_measures"
                        )

#Select non mutliple select columns
#non_multiple_df <- df %>% select(everything(),-contains(select_multiple))

#yes_no <- non_multiple_df %>%  select_if(function(col) is.character(col) && (col) == "yes")

yes_no_colmns <- c( "visit_lastmonth", "still_talk_2_someone" )

equal <- c("consent", "base","ppl_no_land_tenure", "depart_return_safe", "freedommov_day","freedommov_night",
          "info_settlement",
           "idp_proportion_settlem","idp_arrived_from", "idp_arrived_from_reg", "idp_arrived_from_district",
           "hc_push_main", "hc_push_second", "access_market", "market_region",
           "market_district", "market_settlement",
           "distance_to_market",
           "food_situation", "food_source", "health_issues",
            "distance_clinic",
           "region_clinic", "district_clinic", "settlement_clinic",
           "idp_host_relationships",
           "ppl_no_land_tenure",
           "land_tenure_form", "depart_return_safe", "freedommov_day", "freedommov_night",
           "shelter_type", "dam_shelters_reason", 
           "shelters_not_rebuilt", "shelt_not_rebuilt_why", 
          "mainsource_water", "gettingwater_time", "people_using_latrines",
           "waste_disposal", "time_to_school", "education_bar_girls", "education_bar_boys",
           "info_personsource", "road_connection_y_n", "food_price_changed", "nfi_price_changed", "soap_price_changed",
          "how_often_provide_health", "idp_new_arrivals","skip_meals",
          "access_healthservices","unaccompanied_child_y_n", "cases_eviction", "ppl_no_shelter", "surfacewater_drinking",
          "water_sufficient_lastmonth","water_seasonal", "stagnant_water_near", "info_ngo_y_n", "ngo_support_y_n", "plane_connection_y_n",
          "particip_again", "handwashing_access",  "covid_information", "health_workers_available", "dam_shelter"
            )



equal_yes_no <- c(yes_no_colmns, equal)


  
settlement_yes <- df %>%
  select(essential_col, yes_no_colmns) %>%
  group_by_(.dots = c( "calc.region","calc.district","finalsettlment")) %>%
  summarise_all(funs(aok_yes))


settlement_equal <- df %>%
  select(essential_col, equal) %>%
  group_by_(.dots = c( "calc.region","calc.district","finalsettlment")) %>%
  summarise_all(funs(AoK))


settlement_equal_yes <- df %>%
  select(essential_col, equal_yes_no) %>%
  group_by_(.dots = c( "calc.region","calc.district","finalsettlment")) %>%
  summarise_all(funs(AoK))



settlement_mscols <- select_multiple_df %>%
  select(essential_col, select_multile_col) %>%
  group_by_(.dots = c( "calc.region","calc.district","finalsettlment")) %>%
  summarise_all(funs(AoK))

