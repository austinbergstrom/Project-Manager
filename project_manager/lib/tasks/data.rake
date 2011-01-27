task :data => :environment do

  ProjectScope.create_object(:id=>1, :description=>"Rewind")

  ZoneLevel.create_object(:id=>1, :level=>"1")
  ZoneLevel.create_object(:id=>2, :level=>"2")

  $skl1=SkillLevel.create_object(:id=>1, :level=>"1")
  $skl2=SkillLevel.create_object(:id=>2, :level=>"2")
  $skl3=SkillLevel.create_object(:id=>3, :level=>"3")
  $skl4=SkillLevel.create_object(:id=>4, :level=>"4")
  $skl5=SkillLevel.create_object(:id=>5, :level=>"5")

  $sl1 =SupervisorLevel.create_object(:id=>1, :level=>"1")
  $sl2 =SupervisorLevel.create_object(:id=>2, :level=>"2")
  $sl3 =SupervisorLevel.create_object(:id=>3, :level=>"3")
  $sl4 =SupervisorLevel.create_object(:id=>4, :level=>"4")
  $sl5 =SupervisorLevel.create_object(:id=>5, :level=>"5")

  $r0 =Restriction.create_object(:id=>1, :number=>'0', :description=>'Currently Unavailable')
  $r1 =Restriction.create_object(:id=>2, :number=>'1', :description=>'Trainee')
  $r2 =Restriction.create_object(:id=>3, :number=>'2', :description=>'Material Handling')
  $r3 =Restriction.create_object(:id=>4, :number=>'3', :description=>'Fossil Only')
  $r4 =Restriction.create_object(:id=>5, :number=>'4', :description=>'Nuclear Only')
  $r5 =Restriction.create_object(:id=>6, :number=>'5', :description=>'None')

  ProjectType.create_object(:id=>1, :description=>"Nuclear")
  ProjectType.create_object(:id=>2, :description=>"Fossil")
  ProjectType.create_object(:id=>3, :description=>"Both")

  $tr1=TravelRestriction.create_object(:id=>1, :number=>1, :description=>"")
  $tr2=TravelRestriction.create_object(:id=>2, :number=>2, :description=>"Pair With. Do not allow alone.")
  $tr3=TravelRestriction.create_object(:id=>3, :number=>3, :description=>"Limited Travel")
  $tr4=TravelRestriction.create_object(:id=>4, :number=>4, :description=>"")
  $tr5=TravelRestriction.create_object(:id=>5, :number=>5, :description=>"No Restrictions")

  Technician.create_object(:id=>1,
                           :first_name=>"Kirk",
                           :last_name=>"Ainslie",
                           :supervisor_level_id=>$sl3.id,
                           :restriction_id=>$r4.id,
                           :email=>"ddkjainsli.or@netzero.net",
                           :phone_one=>"5038561037",
                           :phone_two=>"5038770057")
  Technician.create_object(:id=>2,
                           :first_name=>"Paul",
                           :last_name=>"Albright",
                           :email=>"Pjames51545518@msn.com")
  Technician.create_object(:id=>3,
                           :first_name=>"Lisa",
                           :last_name=>"Bauer",
                           :restriction_id=>$r4.id,
                           :rewind_experience=>true,
                           :email=>"bauerlisa45@gmail.com")
  Technician.create_object(:id=>4,
                           :first_name=>"Eric",
                           :last_name=>"Bergstrom",
                           :supervisor_level_id=>$sl4.id,
                           :restriction_id=>$r5.id,
                           :skill_level_id=>$skl5.id,
                           :jobs_completed=>6,
                           :valve_experience=>true,
                           :lp_experience=>true,
                           :hp_experience=>true,
                           :generator_experience=>true,
                           :rotor_experience=>true,
                           :rewind_experience=>true,
                           :bwr_experience=>true,
                           :email=>"Eric.Bergstrom@AccessSolutions.net",
                           :phone_one=>"5038712627")
  Technician.create_object(:id=>5,
                           :first_name=>"Dixie",
                           :last_name=>"Birkby",
                           :restriction_id=>$r4.id,
                           :email=>"zjdixie@gmail.com")
  Technician.create_object(:id=>6,
                           :first_name=>"Harold",
                           :last_name=>"Blankenship",
                           :restriction_id=>$r4.id,
                           :email=>"blank.fam@frontier.com")
  Technician.create_object(:id=>7,
                           :first_name=>"Micah",
                           :last_name=>"Buster",
                           :restriction_id=>$r3.id,
                           :valve_experience=>true,
                           :lp_experience=>true,
                           :hp_experience=>true,
                           :generator_experience=>true,
                           :email=>"micahbuster503@yahoo.com")
  Technician.create_object(:id=>8,
                           :first_name=>"Coleen",
                           :last_name=>"Chevalier",
                           :restriction_id=>$r1.id,
                           :rca_experience=>true,
                           :email=>"raechevy@yahoo.com")
  Technician.create_object(:id=>9,
                           :first_name=>"Samuel",
                           :last_name=>"Chevalier",
                           :rca_experience=>true,
                           :email=>"Samuel.chevalier@yahoo.com")
  Technician.create_object(:id=>10,
                           :first_name=>"Deanne",
                           :last_name=>"Cloud",
                           :email=>"Dlc826@gmail.com")
  Technician.create_object(:id=>11,
                           :first_name=>"Jamie",
                           :last_name=>"Cloud")
  Technician.create_object(:id=>12,
                           :first_name=>"Jim",
                           :last_name=>"Cloud")
  Technician.create_object(:id=>13,
                           :first_name=>"Robert",
                           :last_name=>"Collier",
                           :bwr_experience=>true,
                           :email=>"bc7484@yahoo.com")
  Technician.create_object(:id=>14,
                           :first_name=>"William",
                           :last_name=>"Eisenbeis",
                           :email=>"bteisenbeis@gmail.com")
  Technician.create_object(:id=>15,
                           :first_name=>"Virginia",
                           :last_name=>"Fuller",
                           :email=>"vaf09@hotmail.com")
  Technician.create_object(:id=>15,
                           :first_name=>"Rick",
                           :last_name=>"Gould",
                           :supervisor_level_id=>$sl2.id,
                           :email=>"vaf09@hotmail.com")
  Technician.create_object(:id=>16,
                           :first_name=>"Joy",
                           :last_name=>"Hayes",
                           :email=>"Joy4eternity@gmail.com")
  Technician.create_object(:id=>17,
                           :first_name=>"Gabriel",
                           :last_name=>"Hillhouse",
                           :email=>"gabehillhouse@gmail.com")
  Technician.create_object(:id=>18,
                           :first_name=>"Jeffery",
                           :last_name=>"Hillhouse")
  Technician.create_object(:id=>19,
                           :first_name=>"Teri",
                           :last_name=>"Hoffay",
                           :rewind_experience=>true,
                           :email=>"thoffay@gmail.com")
  Technician.create_object(:id=>20,
                           :first_name=>"Paul",
                           :last_name=>"Labold",
                           :mat_experience=>true)
  Technician.create_object(:id=>21,
                           :first_name=>"Robin",
                           :last_name=>"Mahaffey",
                           :supervisor_level_id=>$sl5.id,
                           :rewind_experience=>true,
                           :bwr_experience=>true,
                           :email=>"robinam@earthlink.net")
  Technician.create_object(:id=>22,
                           :first_name=>"Angela",
                           :last_name=>"Mann",
                           :supervisor_level_id=>$sl4.id,
                           :email=>"Angela.Mann@accesssolutions.net")
  Technician.create_object(:id=>23,
                           :first_name=>"Kelvin",
                           :last_name=>"Mann",
                           :email=>"Kelvin.Mann@accesssolutions.net")
  Technician.create_object(:id=>24,
                           :first_name=>"Dale",
                           :last_name=>"McMackin",
                           :email=>"dalemcmackin@hotmail.com")
  Technician.create_object(:id=>25,
                           :first_name=>"Gordon",
                           :last_name=>"McMorris",
                           :supervisor_level_id=>$sl2.id,
                           :email=>"gordy@silvertonrealty.com")
  Technician.create_object(:id=>26,
                           :first_name=>"Jill",
                           :last_name=>"McMorris",
                           :email=>"rodeobutts@netzero.net")
  Technician.create_object(:id=>27,
                           :first_name=>"Ron",
                           :last_name=>"Miller",
                           :supervisor_level_id=>$sl3.id,
                           :jobs_completed=>3,
                           :generator_experience=>true,
                           :rotor_experience=>true,
                           :email=>"ron_miller@g.com")
  Technician.create_object(:id=>28,
                           :first_name=>"Michael",
                           :last_name=>"Morgan",
                           :phone_one=>"5033716639",
                           :phone_two=>"5034095795",
                           :supervisor_level_id=>$sl4.id,
                           :restriction_id=>$r0.id,
                           :email=>"bandmmorgan@comcast.net")
  Technician.create_object(:id=>29,
                           :first_name=>"William",
                           :last_name=>"Nealy",
                           :supervisor_level_id=>$sl3.id,
                           :mat_experience=>true,
                           :email=>"nealyw@suddenlink.net")
  Technician.create_object(:id=>30,
                           :first_name=>"Steve",
                           :last_name=>"Osburn",
                           :travel_restriction_id=>$tr1.id)
  Technician.create_object(:id=>31,
                           :first_name=>"Crista",
                           :last_name=>"Parmeter",
                           :rewind_experience=>true,
                           :email=>"cristalino87@gmail.com")
  Technician.create_object(:id=>32,
                           :first_name=>"Datra",
                           :last_name=>"Robinson",
                           :email=>"DeidreRobinson6@gmail.com")
  Technician.create_object(:id=>33,
                           :first_name=>"Dennis",
                           :last_name=>"Satrum",
                           :supervisor_level_id=>$sl4.id)
  Technician.create_object(:id=>34,
                           :first_name=>"Kathryn",
                           :last_name=>"Schapmire",
                           :supervisor_level_id=>$sl5.id,
                           :email=>"kschapmire@gmail.com")
  Technician.create_object(:id=>35,
                           :first_name=>"Erick",
                           :last_name=>"Stayton",
                           :phone_one=>"5039704547",
                           :restriction_id=>$r5.id,
                           :travel_restriction_id=>$tr5.id,
                           :jobs_completed=>2,
                           :lp_experience=>true,
                           :generator_experience=>true,
                           :email=>"Erick.stayton@comcast.net")
  Technician.create_object(:id=>36,
                           :first_name=>"David",
                           :last_name=>"Stonehouse",
                           :restriction_id=>$r0.id,
                           :email=>"dave42@wvi.com")
  Technician.create_object(:id=>37,
                           :first_name=>"Maurice",
                           :last_name=>"Tiano",
                           :supervisor_level_id=>$sl2.id,
                           :email=>"etiano@comcast.net")
  Technician.create_object(:id=>38,
                           :first_name=>"James",
                           :last_name=>"Tippens",
                           :rewind_experience=>true)
  Technician.create_object(:id=>39,
                           :first_name=>"Carolyn",
                           :last_name=>"Turner",
                           :supervisor_level_id=>$sl5.id,
                           :rewind_experience=>true,
                           :email=>"bartur@centurytel.net")
  Technician.create_object(:id=>40,
                           :first_name=>"Susan",
                           :last_name=>"Turner",
                           :supervisor_level_id=>$sl3.id,
                           :rewind_experience=>true,
                           :email=>"Suet644@yahoo.com")
  Technician.create_object(:id=>41,
                           :first_name=>"Colleen",
                           :last_name=>"Veach",
                           :supervisor_level_id=>$sl5.id,
                           :email=>"scveach@aol.com")
  Technician.create_object(:id=>42,
                           :first_name=>"Earl",
                           :last_name=>"Veach",
                           :email=>"scveach@aol.com")
  Technician.create_object(:id=>43,
                           :first_name=>"Aage",
                           :last_name=>"Wurdinger",
                           :email=>"wurdinger123@hotmail.com")



end