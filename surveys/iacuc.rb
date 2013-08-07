survey "IACUC Protocol", :default_mandatory => false do
section "Information Section" do

  q_information_1 "1. Project Title:"
    a :string

  q_information_2 "2. Project Type:"
    a :string   

  q_1 "a) If a renewal or revision, please provide previous protocol number:"
    a :string

  q_6 "3. Principal Investigator/Faculty Advisor (Note: I am aware that electronic 
        submission of this form constitutes my signature.)"
    a "a) First Name:", :string 
    a "b) Last Name:", :string
    a "c) Department:", :string
    a "d) Title:", :string
    a "e) Phone #:", :string
    a "f) Email address:", :string

  q_application_type "g) Has the P.I. attended ARC training/orientation?", :pick => :any
    a "Yes"    

  q_grant "Extramural grant application (NIH, USDA, etc.)"
    a "i. Provide funding agency name:", :string
    a "ii. Assigned grant number (if available):", :string
  label "iii. Submission date:"

  q_sub_date_month "month", :pick => :one, :display_type => :dropdown
    ["January","February", "March", "April","May","June","July","August","September","October","November","December"].each do |month| 
        a month
    end

  q_sub_date_day "day", :pick => :one, :display_type => :dropdown
    [ "1","2", "3", "4","5","6","7","8","9","10","11","12",
      "13","14","15","16","17","18","19","20","21","22","23",
      "24","25","26","27","28","29","30"].each do |day| 
        a day
    end

  q_sub_date_year "Year"
    a :string   

  q_ngrant1 "iv. In whose name is the grant submitted:"
    a :string   

  q_intr "b) Intramural funding application (Dept/College):", :pick => :any
    a "Yes" 

  q_comm "Commercial/Industry funding (Private Sector):", :pick => :any
    a "Yes" 

  q_i "i. Provide complete company name:"
    a :string

  q_o1 "d) Other :"
    a :text 
end

section "General Section" do
  q_1g "1. Provide an abstract that summarizes the overall scientific goals 
  and specific objectives of the proposed animal work.(Use 
  language that community members or those not in your field of 
  scientific discipline can understand. Define all abbreviations.)"
    a :text	

  q_2g "2. Describe in non-scientific language (high-school level of 
    understanding) how the proposed project will benefit human or 
    animal health, the advancement of knowledge, or the good of society."
  a :text

  label "3. As primary investigator, I have determined, by means of the 
    following sources, searches, or methods, that alternatives to 
    procedures which may cause pain or distress are not available, and 
    that this protocol does not unnecessarily duplicate previous 
    experiments. USDA regulations require documentation (to be 
    maintained by the PI) of the following sources searched."

  q_ngrant "a) Databases searched (Minimum of two):"
  a_2ca :string

  q_o "b) Specify all key words that were used in the search (e.g. MESH headings):"
  a :text	

  q_ngrant2 "c) What years were covered by the search?"
  a_222 :string
  label "d) Provide the most recent date on which the search was 
  performed. (must be within six months):[yyyy/mm/dd]"
  q "month2", :pick => :one, :display_type => :dropdown
  ["January","February", "March", "April","May","June","July","August","September","October","November","December"].each{ |level| a level}
  q "day2", :pick => :one, :display_type => :dropdown
  ["1","2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"].each{ |level| a level}

  q_Year2 "Year"
    a_2c :string
    
  q_classifications "e) Did your search find any alternatives 
  	to your proposed animal related procedures that would allow...", :pick => :any
    a_12 "i. Reduction?"
    
  q_e1 "Explain:"
    a :text
    a_2a "ii. Replacement?"
    
  q_e2 "Explain:"
    a :text
    a_3 "iii. Refinement?"
    
  q_e3 "Explain:"
    a :text
    
  q_wh "4. Why must animals be used in this study? (Check the appropriate boxes)", :pick => :any
    a_1a "a) No in vitro options are available."
    a_2b "b) Systemic interactions are needed."
    a_3 "c) Studies cannot or should not be undertaken in humans"
    a_41 "d) studies involve analysis of behaviors or biologic processes"
  	a_5 "e) Other:"
  	
  q_ea3 "*If you selected 'Other', Explain:"
    a :text
    
  q_por "5. Will any portion of the live work performed under this protocol be conducted 
    at facilities or institutions outside Montana State University?", :pick => :any
    a_4 "Yes"
    
  q_i2 "i. What procedures will be done?"
      a :text
    
  q_ii "ii. What species will be involved?"
      a_21 :string
    
  q_ii1 "iii. At what institution will this activity take place?"
      a_22 :string
    
  q_ii2 "iv. Provide the Office of Laboratory Animal Welfare 
      (OLAW) Assurance Number of the institution."
      a_23 :string
    
  q_ii3 "v. Provide the IACUC approval number (a copy of the 
      approval letter must be submitted to the IACUC office):"
      a_24 :string
    
  q_fund1 "6. Will any live animals be housed outside the Animal 
      Resources Center for continuous periods of longer than 12 hours?", :pick => :any
      a_45 "Yes"
    
  q_i3 "i. Building:"
      a :text
    
  q_ii4 "ii. Room number:"
      a :text
    
  q_iii3 "iii. Provide justification:"
      a :text
end

section "Mouse" do
               
  q_m1 "1.Strain"
      a :string
    
  q_m2 "2.Age or Weight"
      a :string
    
  q_m3q "3.Rationale for using this species", :pick => :one
      a_a "a)There is demonostrated similarity of the process under study to that of humans"
      a_b "b)A large amount of relevant data has already been derived from this species"
      a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
      a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
      a_e "e)Other"
    
  q_mo "If you checked 'Other' explain:"
      a_1 :text
      dependency :rule=>"Z"
      condition_Z :q_m3q, "==", :a_e
    
  q_m4 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
      a :text
      
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
      answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
      answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
      answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
      answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
      answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
      answer "f)This protocol is a teaching or training"
      answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
    
  q_m6a "a) Total number of animals justified "
      a :string
    
  q_m6b  "b) Category C Minimal, transient, or no pain/distress"
      a :string
    
  q_m6c  "c)Category D: pain/distress relieved by appropriate measures"
      a :string
    
  q_m6d  "d) Category E: unrelieved pain/distress"
      a :string
    
  q_m7 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
      a :text
    
  q_m8 "8. where will the animals be housed?"
      a :string             
  
  q_mmm "9.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
      a_yes "Yes"
      a_no  "No"

  q "a) Describe and justify"
      a :text
      dependency :rule=>"A"
      condition_A :q_mmm, "==", :a_yes        
    
  q_yes1 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
      a :text
      dependency :rule=>"A"
      condition_A :q_yes1, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_yes1, "==", :a_yes
    
  q_m1c "c)Who will perform the surgical procedure or tissue harvest?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_yes1, "==", :a_yes
    
  q_m1d "d) Building and room # where procedures will be performed?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_yes1, "==", :a_yes
    
  q_m10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
      a_yes "Yes"
      a_no "No"
      dependency :rule=>"B"         
      condition_B :q_yes1, "==", :a_yes
    
  q_m1i "i) What procedures will be done to minimize the incidence of sepsis?"
      a :string
      dependency :rule=>"A"
      condition_A :q_m10e, "==", :a_yes
    
  q_m1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m10e, "==", :a_yes
    
  q_m1iii "iii)Who is responsible for the post-operative care of the animals?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m10e, "==", :a_yes
    
  q_mfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
      a_yes "Yes"
      a_no "No"
      dependency :rule=>"B"         
      condition_B :q_yes1, "==", :a_yes
    
  q_mfi "i) How many surgeries will the animal experience?"
      a :string
      dependency :rule=>"A"
      condition_A :mfq, "==", :a_yes
    
  q_mfii "ii)What will be the time period between surgeries?"
      a :string
      dependency :rule=>"B"         
      condition_B :mfq, "==", :a_yes
    
  q_mfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
      a :string
      dependency :rule=>"B"         
      condition_B :mfq, "==", :a_yes
    
  q_m11q "11.  Will the animals be anesthetized?", :pick => :one
      a_yes "Yes"
      a_no  "No"
      
  label "a) induction"
      dependency :rule=>"A"
      condition_A :q_m11q, "==", :a_yes
    
  q_m11a "agent"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11a22a "does (mg/kg):"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11a33b1 "route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
      
  label "b) Maintenance"
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11b "agent"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11b2 "does (mg/kg):"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11b3 "route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m11b4 "Frequency of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m1dd "d) Who will be responsible for monitoring anesthesia?"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m11q, "==", :a_yes
    
  q_m12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
      a_yes "Yes"
      a_no "No"
      
  label "a) induction"
      dependency :rule=>"A"
      condition_A :q_m12q, "==", :a_yes
    
  q_m11a2 "agent"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m11a22 "does (mg/kg):"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m11a32 "route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m11b42 "Frequency of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m12c "c) Provide the justification for the use of a muscle relaxant."
      a :text
      dependency :rule=>"B"         
      condition_B :q_m12q, "==", :a_yes
    
  q_m13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
      a_yes "Yes"
      a_no "No"
      
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
      dependency :rule=>"A"
      condition_A :q_m13q, "==", :a_yes
    
  q_m11a3 "agent"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m13q, "==", :a_yes
    
  q_m11a23 "does (mg/kg):"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m13q, "==", :a_yes
    
  q_m11a33 "route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m13q, "==", :a_yes
    
  q_m11b43 "Frequency of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m13q, "==", :a_yes
    
  q_m14q "14. Will animals be immunized?", :pick => :one
      a_yes "Yes"
      a_no "No"
      
  label "a) Initial Immunization"
      dependency :rule=>"A"
      condition_A :q_m14q, "==", :a_yes
    
  q_m11a3i "i. Antigen:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11a33iii "iii. Route of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11b43iv "iv. Anatomical site of injection:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11b43va "v. Volume per site:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11b43vi "vi. Number of sites to be injected:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes

  label "b) Re-immunization (booster)"
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11a3ib "i. Adjuvant:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11a23iib "ii. Frequency of re-immunizations:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11a33iiib "iii. Anatomical site of injection:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11b43ivb "iv. Volume per site:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m11b43vab "v. Number of sites to be injected:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m14q, "==", :a_yes
    
  q_m15q "15.  Will monoclonal antibodies be generated utilized the ascites production method?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m15a "a) Justify why this method is required and why alteratives are not available:"
      a :text
      dependency :rule=>"A"
      condition_A :q_m15q, "==", :a_yes
    
  q_m15b "b) Describe methods that will be used to decrease pain and distress:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m15q, "==", :a_yes
    
  q_m16q "16. Will blood be collected from the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m16a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m16q, "==", :a_yes
    
  q_m16b "b) Maximum volume of blood to be obtained at each collection:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m16q, "==", :a_yes
    
  q_m16c "c) Frequency of blood collection:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m16q, "==", :a_yes
    
  q_m17q "17. Will tumors be implanted or induced in the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m17a "a) Identify the tumor line and/or tumor type:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m17q, "==", :a_yes
    
  q_m17b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m17q, "==", :a_yes
    
  q_m17c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m17q, "==", :a_yes
    
  q_m17d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m17q, "==", :a_yes
    
  q_m17d1 "if no, Justify:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m17q, "==", :a_yes
    
  q_m17qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
      a_yes "Yes"
      a_no "No"
      dependency :rule=>"B"         
      condition_B :q_m17q, "==", :a_yes
    
  q_m17e1 "if no, Justify:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m17qe, "==", :a_yes
    
  q_m18q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m17cc "a)Provide the maximum length of time conscious animals will be restrained?"
      a :string
      dependency :rule=>"A"
      condition_A :q_m18q, "==", :a_yes
    
  q_m17dd "b) What type of restraint device will be used?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m18q, "==", :a_yes
    
  q_m17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m18q, "==", :a_yes
    
  q_m19q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m19a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
      a :text
      dependency :rule=>"A"
      condition_A :q_m19q, "==", :a_yes
    
  q_m19b "b) Descibe the adverse stimullus, including frequrency and duration."
      a :text
      dependency :rule=>"B"         
      condition_B :q_m19q, "==", :a_yes
    
  q_m19c "c)Describe the limits of the stimulus if the desired respone does not occur."
      a :text
      dependency :rule=>"B"         
      condition_B :q_m19q, "==", :a_yes
    
  q_m20q "20. Is water or food restriction required for this study?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m20a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
      a :text
      dependency :rule=>"A"
      condition_A :q_m20q, "==", :a_yes
    
  q_m20b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20i "i. Provid the maximum restriction levels:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20c "c) What baseline data that will be collected prior to restriction?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20d "d) Describe the initial acclimation to restriction:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m20f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m20q, "==", :a_yes
    
  q_m21q "21. Will animals be irradiated?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m21i "a) Room location"
      a :string
      dependency :rule=>"A"
      condition_A :q_m21q, "==", :a_yes
    
  q_m21ii "b)Number of animals to be irradiated:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m21q, "==", :a_yes
    
  q_m21c "c)Who will operate the irradiation equipment?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m21q, "==", :a_yes
    
  q_m22q "22.  Will radioisotopes be administered to the animals in the study?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m22ac "a) list the personnel who will handle the radioisotopes:"
      a :text
      dependency :rule=>"A"
      condition_A :q_m22q, "==", :a_yes
    
  q_m22b "b)List all rooms where radioisotopes will be used:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m22q, "==", :a_yes
    
  q_m22c1 "c) Number of animals to which radioisotopes will be administered:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m22q, "==", :a_yes
    
  q_m22d "d) Radioisotope that will be used:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m22q, "==", :a_yes
    
  q_m23q "23. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m23c "Name of organism:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m23q, "==", :a_yes
    
  q_m23a "Biosafety level:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m23q, "==", :a_yes
    
  q_m23b1 "Route of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m23q, "==", :a_yes
    
  q_m23b2 "shed:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m23q, "==", :a_yes
    
  q_m23d "Length of shed:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m23q, "==", :a_yes
    
  q_m24q "24.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m24c1 "Name::"
      a :string
      dependency :rule=>"A"
      condition_A :q_m24q, "==", :a_yes
    
  q_m24c2 "Biosafety level:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m24q, "==", :a_yes
    
  q_m24c3 "Route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m24q, "==", :a_yes
    
  q_m244 "Housed:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m24q, "==", :a_yes
    
  q_m245 "Special handling:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m24q, "==", :a_yes
    
  q_m25q "25.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m25a "Name of organism:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m25q, "==", :a_yes
    
  q_m25b "Biosafety level:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m25q, "==", :a_yes
    
  q_m25c "Route of administration:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m25q, "==", :a_yes
    
  q_m25d "shed:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m25q, "==", :a_yes
    
  q_m25f "Length of shed:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m25q, "==", :a_yes
    
  q_m26q "26. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m26c "Name:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m26q, "==", :a_yes
    
  q_m26c1 "Route of exposure:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m26q, "==", :a_yes
    
  q_m26c2 "Exposure:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m26q, "==", :a_yes
    
  q_m26c3 "Excreted:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m26q, "==", :a_yes
    
  q_m26c4 "Length of excretion:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m26q, "==", :a_yes
    
  q_m27 "27. Will a piece of tail be amputated for DNA analysis or any other testing?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m27q "a)Will the tail amputation be performed on animals after 21 days of age?", :pick => :one
      a_yes "Yes"
      a_no "No"
      dependency :rule=>"A"
      condition_A :q_m27, "==", :a_yes
    
  q_m27c "i. Anesthesia is required for tail ampuation procedures on animals after 21 days of age.  Provide the anesthesia regimen for tail amputation in Question #11."
      a :text
      dependency :rule=>"B"         
      condition_B :q_m27q, "==", :a_yes
    
  q_m28q "28. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m28ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
      a :text
      dependency :rule=>"A"
      condition_A :q_m28q, "==", :a_yes
    
  q_m28cb "b)Describe the expected clinical signs and time to death for this study."
      a :text
      dependency :rule=>"B"         
      condition_B :q_m28q, "==", :a_yes
    
  q_m28cc "c)List personnel responsible for animal observations"
      a :text
      dependency :rule=>"B"         
      condition_B :q_m28q, "==", :a_yes
    
  q_m28cd "d) How oftern will animals be monitored?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m28q, "==", :a_yes
    
  q_m28ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
      a :string
      dependency :rule=>"B"         
      condition_B :q_m28q, "==", :a_yes
    
  q_m29q "29.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m29c "Agent:"
      a :string
      dependency :rule=>"A"
      condition_A :q_m29q, "==", :a_yes
    
  q_m29c1 "Route:"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m29q, "==", :a_yes
    
  q_m30q "30. Will a phyical means of euthanasia be used on the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
    
  q_m30 "a) what physical method of euthanasia will be used?"
      a :string
      dependency :rule=>"A"
      condition_A :q_m30q, "==", :a_yes
    
  q_m30qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
      a_yes "Yes"
      a_no "No"
      dependency :rule=>"B"         
      condition_B :q_m30q, "==", :a_yes
    
  q_m30i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
      a :text
      dependency :rule=>"A"
      condition_A :q_m30qb, "==", :a_yes
    
  q_m30ii "ii. Who will perform the phyical method of euthanasia?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m30qb, "==", :a_yes
    
  q_m30iii "iii. What training have been provided?"
      a :string
      dependency :rule=>"B"         
      condition_B :q_m30qb, "==", :a_yes
end

section "Rat" do
         
  q_r1 "1.Strain"
    a :string
  
  q_r2 "2.Age or Weight"
    a :string
  
  q_r3q "3.Rationale for using this species", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other"
  
  q_ro "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_r3q, "==", :a_e
  
  q_r4 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text
        
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_r6a "a) Total number of animals justified "
    a :string
  
  q_r6b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_r6c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_r6d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_r7 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_r8 "8. where will the animals be housed?"
    a :string         
  
  q_rrr "9.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
      a :text
      dependency :rule=>"A"
      condition_A :q_rrr, "==", :a_yes        
    
    q_yes13 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
      a_yes "Yes"
      a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
      a :text
      dependency :rule=>"A"
      condition_A :q_yes13, "==", :a_yes

  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
      a :text
      dependency :rule=>"B"         
      condition_B :q_yes13, "==", :a_yes
    
  q_r1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes13, "==", :a_yes
  
  q_r1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes13, "==", :a_yes
  
  q_r10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes13, "==", :a_yes
  
  q_r1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_r10e, "==", :a_yes
  
  q_r1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r10e, "==", :a_yes
  
  q_r1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r10e, "==", :a_yes
  
  q_rfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes13, "==", :a_yes
  
  q_rfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :rfq, "==", :a_yes
  
  q_rfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiii2 "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_r11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"

 label "a) induction"
    dependency :rule=>"A"
    condition_A :q_r11q, "==", :a_yes
  
  q_r11a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
 label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r11q, "==", :a_yes
  
  q_r12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
 label "a) induction"
    dependency :rule=>"A"
    condition_A :q_r12q, "==", :a_yes
  
  q_r11a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r11a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_r12q, "==", :a_yes
  
  q_r13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
 label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_r13q, "==", :a_yes
  
  q_r11a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r13q, "==", :a_yes
  
  q_r11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r13q, "==", :a_yes
  
  q_r11a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r13q, "==", :a_yes
  
  q_r11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r13q, "==", :a_yes
  
  q_r14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
 label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_r14q, "==", :a_yes
  
  q_r11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
 label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
  
  q_r11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r14q, "==", :a_yes
          
  q_r15q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r15a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r15q, "==", :a_yes
  
  q_r15b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r15q, "==", :a_yes
  
  q_r15c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r15q, "==", :a_yes
  
  q_r16q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r16a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r16q, "==", :a_yes
  
  q_r16b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r16q, "==", :a_yes
  
  q_r16c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r16q, "==", :a_yes
  
  q_r16d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r16q, "==", :a_yes
  
  q_r16d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r16q, "==", :a_yes
  
  q_r16qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_r16q, "==", :a_yes
  
  q_r16e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r16qe, "==", :a_yes
  
  q_r17q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_r17q, "==", :a_yes
  
  q_r17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r17q, "==", :a_yes
  
  q_r17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r18q, "==", :a_yes
  
  q_r18q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r18a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_r18q, "==", :a_yes
  
  q_r18b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_r18q, "==", :a_yes
  
  q_r18c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_r18q, "==", :a_yes
  
  q_r19q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r19a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_r19q, "==", :a_yes
  
  q_r19b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r19q, "==", :a_yes
  
  q_r19f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r20q, "==", :a_yes
          
  q_r20q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r20ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_r20q, "==", :a_yes
  
  q_r20b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r20q, "==", :a_yes
  
  q_r20c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r20q, "==", :a_yes
  
  q_r20d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r20q, "==", :a_yes
  
  q_r21q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21c2 "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r21q, "==", :a_yes
  
  q_r21a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r21q, "==", :a_yes
  
  q_r21b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r21q, "==", :a_yes
  
  q_r21b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r21q, "==", :a_yes
  
  q_r21d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r21q, "==", :a_yes
  
  q_r22q "22.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c11 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_r22q, "==", :a_yes
  
  q_r22c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r22q, "==", :a_yes
  
  q_r22c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r22q, "==", :a_yes
  
  q_r224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r22q, "==", :a_yes
  
  q_r225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r22q, "==", :a_yes
  
  q_r23q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r23a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r23q, "==", :a_yes
  
  q_r23b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r23q, "==", :a_yes
  
  q_r23c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r23q, "==", :a_yes
  
  q_r23d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r23q, "==", :a_yes
  
  q_r23f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r23q, "==", :a_yes
  
  q_r24q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r24c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r24q, "==", :a_yes
  
  q_r24c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r24q, "==", :a_yes
  
  q_r24c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r24q, "==", :a_yes
  
  q_r24c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r24q, "==", :a_yes
  
  q_r24c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r24q, "==", :a_yes
          
  q_r25q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r25ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_r25q, "==", :a_yes
  
  q_r25cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_r25q, "==", :a_yes
  
  q_r25cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_r25q, "==", :a_yes
  
  q_r25cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r25q, "==", :a_yes
  
  q_r25ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_r25q, "==", :a_yes
  
  q_r26q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r26c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r26q, "==", :a_yes
  
  q_r26c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r26q, "==", :a_yes
  
  q_r27q "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r27 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_r27q, "==", :a_yes
  
  q_r27qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_r27q, "==", :a_yes
  
  q_r27i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_r27qb, "==", :a_yes
  
  q_r27ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r27qb, "==", :a_yes
  
  q_r27iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_r27qb, "==", :a_yes
end

section "Hamster" do
      
  q_h1 "1.Strain"
    a :string
  
  q_h2 "2.Age or Weight"
    a :string
  
  q_h3q "3.Rationale for using this species", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e1 "e)Other"
  
  q_ho "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_h3q, "==", :a_e1
  
  q_h4 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text
        
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_h6a "a) Total number of animals justified "
    a :string
  
  q_h6b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_h6c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_h6d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_h7 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_h8 "8. where will the animals be housed?"
    a :string
        
  
  q_hhh "9.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_hhh, "==", :a_yes
  
  
  q_yes14 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14, "==", :a_yes
  
  q_h1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14, "==", :a_yes
  
  q_h1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14, "==", :a_yes
  
  q_h10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14, "==", :a_yes
  
  q_h1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h10e, "==", :a_yes
  
  q_h1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h10e, "==", :a_yes
  
  q_h1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h10e, "==", :a_yes
  
  q_hfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14, "==", :a_yes
  
  q_hfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_hfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_h11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_h11q, "==", :a_yes
  
  q_h11a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h11q, "==", :a_yes
  
  q_h12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_h12q, "==", :a_yes
  
  q_h11a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h11a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h12q, "==", :a_yes
  
  q_h13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_h13q, "==", :a_yes
  
  q_h11a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h13q, "==", :a_yes
  
  q_h11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h13q, "==", :a_yes
  
  q_h11a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h13q, "==", :a_yes
  
  q_h11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h13q, "==", :a_yes
  
  q_h14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_h14q, "==", :a_yes
  
  q_h11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
  
  q_h11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h14q, "==", :a_yes
    
  q_h15q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h15a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h15q, "==", :a_yes
  
  q_h15b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h15q, "==", :a_yes
  
  q_h15c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h15q, "==", :a_yes
  
  q_h16q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h16a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h16q, "==", :a_yes
  
  q_h16b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h16q, "==", :a_yes
  
  q_h16c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h16q, "==", :a_yes
  
  q_h16d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h16q, "==", :a_yes
  
  q_h16d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h16q, "==", :a_yes
  
  q_h16qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_h16q, "==", :a_yes
  
  q_h16e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h16qe, "==", :a_yes
  
  q_h17q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h17q, "==", :a_yes
  
  q_h17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h17q, "==", :a_yes
  
  q_h17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h18q, "==", :a_yes
  
  q_h18q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h18a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_h18q, "==", :a_yes
  
  q_h18b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h18q, "==", :a_yes
  
  q_h18c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h18q, "==", :a_yes
  
  q_h19q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h19a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_h19q, "==", :a_yes
  
  q_h19b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h19q, "==", :a_yes
  
  q_h19f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h20q, "==", :a_yes
          
  q_h20q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h20ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_h20q, "==", :a_yes
  
  q_h20b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h20q, "==", :a_yes
  
  q_h20c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h20q, "==", :a_yes
  
  q_h20d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h20q, "==", :a_yes
  
  q_h21q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21c5 "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h21q, "==", :a_yes
  
  q_h21a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h21q, "==", :a_yes
  
  q_h21b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h21q, "==", :a_yes
  
  q_h21b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h21q, "==", :a_yes
  
  q_h21d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h21q, "==", :a_yes
  
  q_h22q "22.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_h22q, "==", :a_yes
  
  q_h22c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h22q, "==", :a_yes
  
  q_h22c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h22q, "==", :a_yes
  
  q_h224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h22q, "==", :a_yes
  
  q_h225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h22q, "==", :a_yes
  
  q_h23q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h23a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h23q, "==", :a_yes
  
  q_h23b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h23q, "==", :a_yes
  
  q_h23c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h23q, "==", :a_yes
  
  q_h23d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h23q, "==", :a_yes
  
  q_h23f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h23q, "==", :a_yes
  
  q_h24q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h24c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h24q, "==", :a_yes
  
  q_h24c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h24q, "==", :a_yes
  
  q_h24c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h24q, "==", :a_yes
  
  q_h24c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h24q, "==", :a_yes
  
  q_h24c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h24q, "==", :a_yes
          
  q_h25q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h25ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_h25q, "==", :a_yes
  
  q_h25cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h25q, "==", :a_yes
  
  q_h25cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h25q, "==", :a_yes
  
  q_h25cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h25q, "==", :a_yes
  
  q_h25ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_h25q, "==", :a_yes
  
  q_h26q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h26c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h26q, "==", :a_yes
  
  q_h26c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h26q, "==", :a_yes
  
  q_h27q "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h27 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h27q, "==", :a_yes
  
  q_h27qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_h27q, "==", :a_yes
  
  q_h27i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_h27qb, "==", :a_yes
  
  q_h27ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h27qb, "==", :a_yes
  
  q_h27iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h27qb, "==", :a_yes
end

section "Rabbit" do
  
  
  q_rb1 "1.Strain"
    a :string
  
  q_rb2 "2.Age or Weight"
    a :string
  
  q_rb3q "3.Rationale for using this species", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other"
  
  q_rbo "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_rb3q, "==", :a_e
  
  q_rb4 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text
        
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_rb6a "a) Total number of animals justified "
    a :string
  
  q_rb6b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_rb6c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_rb6d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_rb7 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_rb8 "8. where will the animals be housed?"
    a :string
        
  
  q_rbrr "9.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_rbrr, "==", :a_yes
  
  
  q_yes15 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes15, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes15, "==", :a_yes
  
  q_rb1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes15, "==", :a_yes
  
  q_rb1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes15, "==", :a_yes
  
  q_rb10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes15, "==", :a_yes
  
  q_rb1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb10e, "==", :a_yes
  
  q_rb1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb10e, "==", :a_yes
  
  q_rb1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb10e, "==", :a_yes
  
  q_rbfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes15, "==", :a_yes
  
  q_rbfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :rfq, "==", :a_yes
  
  q_rbfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rbfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rb11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_rb11q, "==", :a_yes
  
  q_rb11a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb11q, "==", :a_yes
  
  q_rb12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_rb12q, "==", :a_yes
  
  q_rb11a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb11a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb12q, "==", :a_yes
  
  q_rb13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_rb13q, "==", :a_yes
  
  q_rb11a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb13q, "==", :a_yes
  
  q_rb11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb13q, "==", :a_yes
  
  q_rb11a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb13q, "==", :a_yes
  
  q_rb11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb13q, "==", :a_yes
  
  q_rb14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_rb14q, "==", :a_yes
  
  q_rb11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
  
  q_rb11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb14q, "==", :a_yes
          
  q_rb15q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb15a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb15q, "==", :a_yes
  
  q_rb15b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb15q, "==", :a_yes
  
  q_rb15c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb15q, "==", :a_yes
  
  q_rb16q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb16a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb16q, "==", :a_yes
  
  q_rb16b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb16q, "==", :a_yes
  
  q_rb16c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb16q, "==", :a_yes
  
  q_rb16d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb16q, "==", :a_yes
  
  q_rb16d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb16q, "==", :a_yes
  
  q_rb16qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_rb16q, "==", :a_yes
  
  q_rb16e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb16qe, "==", :a_yes
  
  q_rb17q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb17q, "==", :a_yes
  
  q_rb17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb17q, "==", :a_yes
  
  q_rb17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb18q, "==", :a_yes
  
  q_rb18q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb18a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_rb18q, "==", :a_yes
  
  q_rb18b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb18q, "==", :a_yes
  
  q_rb18c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb18q, "==", :a_yes
  
  q_rb19q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb19a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_rb19q, "==", :a_yes
  
  q_rb19b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb19q, "==", :a_yes
  
  q_rb19f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb20q, "==", :a_yes
    
  
  q_rb20q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb20ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_rb20q, "==", :a_yes
  
  q_rb20b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb20q, "==", :a_yes
  
  q_rb20c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb20q, "==", :a_yes
  
  q_rb20d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb20q, "==", :a_yes
  
  q_rb21q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb21c "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb21q, "==", :a_yes
  
  q_rb21a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb21q, "==", :a_yes
  
  q_rb21b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb21q, "==", :a_yes
  
  q_rb21b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb21q, "==", :a_yes
  
  q_rb21d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb21q, "==", :a_yes
  
  q_rb22q "22.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb22c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb22q, "==", :a_yes
  
  q_rb22c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb22q, "==", :a_yes
  
  q_rb22c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb22q, "==", :a_yes
  
  q_rb224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb22q, "==", :a_yes
  
  q_rb225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb22q, "==", :a_yes
  
  q_rb23q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb23a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb23q, "==", :a_yes
  
  q_rb23b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb23q, "==", :a_yes
  
  q_rb23c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb23q, "==", :a_yes
  
  q_rb23d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb23q, "==", :a_yes
  
  q_rb23f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb23q, "==", :a_yes
  
  q_rb24q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb24c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb24q, "==", :a_yes
  
  q_rb24c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb24q, "==", :a_yes
  
  q_rb24c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb24q, "==", :a_yes
  
  q_rb24c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb24q, "==", :a_yes
  
  q_rb24c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb24q, "==", :a_yes
    
  
  q_rb25q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb25ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_rb25q, "==", :a_yes
  
  q_rb25cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb25q, "==", :a_yes
  
  q_rb25cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_rb25q, "==", :a_yes
  
  q_rb25cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb25q, "==", :a_yes
  
  q_rb25ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb25q, "==", :a_yes
  
  q_rb26q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb26c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb26q, "==", :a_yes
  
  q_rb26c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb26q, "==", :a_yes
  
  q_rb27q "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_rb27 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_rb27q, "==", :a_yes
  
  q_rb27qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_rb27q, "==", :a_yes
  
  q_rb27i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_rb27qb, "==", :a_yes
  
  q_rb27ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb27qb, "==", :a_yes
  
  q_rb27iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_rb27qb, "==", :a_yes
end

section "Gerbil" do
  
  q_g1 "1.Strain"
    a :string
  
  q_g2 "2.Age or Weight"
    a :string
  
  q_g3q "3.Rationale for using this species", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other"
  
  q_go "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_g3q, "==", :a_e
  
  q_g4 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text
        
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_g6a "a) Total number of animals justified "
    a :string
  
  q_g6b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_g6c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_g6d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_g7 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_g8 "8. where will the animals be housed?"
    a :string
        
  
  q_grr "9.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_grr, "==", :a_yes
  
  
  q_yes12 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes12, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes12, "==", :a_yes
  
  q_g1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes12, "==", :a_yes
  
  q_g1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes12, "==", :a_yes
  
  q_g10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes12, "==", :a_yes
  
  q_g1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_g10e, "==", :a_yes
  
  q_g1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g10e, "==", :a_yes
  
  q_g1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g10e, "==", :a_yes
  
  q_gfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes12, "==", :a_yes
  
  q_gfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :rfq, "==", :a_yes
  
  q_gfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_gfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_g11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_g11q, "==", :a_yes
  
  q_g11a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g11q, "==", :a_yes
  
  q_g12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_g12q, "==", :a_yes
  
  q_g11a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g11a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_g12q, "==", :a_yes
  
  q_g13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_g13q, "==", :a_yes
  
  q_g11a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g13q, "==", :a_yes
  
  q_g11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g13q, "==", :a_yes
  
  q_g11a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g13q, "==", :a_yes
  
  q_g11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g13q, "==", :a_yes
  
  q_g14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_g14q, "==", :a_yes
  
  q_g11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
  
  q_g11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g14q, "==", :a_yes
    
  q_g15q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g15a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g15q, "==", :a_yes
  
  q_g15b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g15q, "==", :a_yes
  
  q_g15c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g15q, "==", :a_yes
  
  q_g16q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g16a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g16q, "==", :a_yes
  
  q_g16b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g16q, "==", :a_yes
  
  q_g16c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g16q, "==", :a_yes
  
  q_g16d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g16q, "==", :a_yes
  
  q_g16d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g16q, "==", :a_yes
  
  q_g16qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_g16q, "==", :a_yes
  
  q_g16e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g16qe, "==", :a_yes
  
  q_g17q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_g17q, "==", :a_yes
  
  q_g17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g17q, "==", :a_yes
  
  q_g17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g18q, "==", :a_yes
  
  q_g18q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g18a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_g18q, "==", :a_yes
  
  q_g18b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_g18q, "==", :a_yes
  
  q_g18c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_g18q, "==", :a_yes
  
  q_g19q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g19a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_g19q, "==", :a_yes
  
  q_g19b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g19q, "==", :a_yes
  
  q_g19f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g20q, "==", :a_yes
          
  q_g20q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g20ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_g20q, "==", :a_yes
  
  q_g20b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g20q, "==", :a_yes
  
  q_g20c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g20q, "==", :a_yes
  
  q_g20d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g20q, "==", :a_yes
  
  q_g21q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g21c "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g21q, "==", :a_yes
  
  q_g21a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g21q, "==", :a_yes
  
  q_g21b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g21q, "==", :a_yes
  
  q_g21b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g21q, "==", :a_yes
  
  q_g21d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g21q, "==", :a_yes
  
  q_g22q "22.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g22c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_g22q, "==", :a_yes
  
  q_g22c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g22q, "==", :a_yes
  
  q_g22c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g22q, "==", :a_yes
  
  q_g224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g22q, "==", :a_yes
  
  q_g225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g22q, "==", :a_yes
  
  q_g23q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g23a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g23q, "==", :a_yes
  
  q_g23b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g23q, "==", :a_yes
  
  q_g23c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g23q, "==", :a_yes
  
  q_g23d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g23q, "==", :a_yes
  
  q_g23f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g23q, "==", :a_yes
  
  q_g24q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g24c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g24q, "==", :a_yes
  
  q_g24c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g24q, "==", :a_yes
  
  q_g24c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g24q, "==", :a_yes
  
  q_g24c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g24q, "==", :a_yes
  
  q_g24c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g24q, "==", :a_yes
          
  q_g25q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g25ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_g25q, "==", :a_yes
  
  q_g25cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_g25q, "==", :a_yes
  
  q_g25cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_g25q, "==", :a_yes
  
  q_g25cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g25q, "==", :a_yes
  
  q_g25ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_g25q, "==", :a_yes
  
  q_g26q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g26c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_g26q, "==", :a_yes
  
  q_g26c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g26q, "==", :a_yes
  
  q_g27q "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_g27 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_g27q, "==", :a_yes
  
  q_g27qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_g27q, "==", :a_yes
  
  q_g27i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_g27qb, "==", :a_yes
  
  q_g27ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g27qb, "==", :a_yes
  
  q_g27iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_g27qb, "==", :a_yes
end

section "Sheep" do
        
  q_sh11 "1. Breed:"
    a :string
  
  q_sh12 "2.Age:"
    a :string
  
  q_sh13 "3. Source acquired from:"
    a :text
  
  q_sh14q "4. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_sh1o "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_sh14q, "==", :a_e
  
  q_sh15 "5. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "6. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"7.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_h16aa "a) Total number of animals justified "
    a :string
  
  q_h16bb  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_h16cc  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_h16dd  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_h17 "8.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_h18 "9. where will the animals be housed?"
    a :string
      
  q_h1hh "10.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_h1hh, "==", :a_yes
      
  q_yes14a "11.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14a, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14a, "==", :a_yes
  
  q_h11c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14a, "==", :a_yes
  
  q_h11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14a, "==", :a_yes
  
  q_h110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14a, "==", :a_yes
  
  q_h11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h110e, "==", :a_yes
  
  q_h11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h110e, "==", :a_yes
  
  q_h11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h110e, "==", :a_yes
  
  q_h1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14a, "==", :a_yes
  
  q_h1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_h1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rf1iii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_h111q "12.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_h111q, "==", :a_yes
  
  q_h111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h111q, "==", :a_yes
  
  q_h112q "13.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_h112q, "==", :a_yes
  
  q_h111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h112q, "==", :a_yes
  
  q_h113q "14. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_h113q, "==", :a_yes
  
  q_h111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h113q, "==", :a_yes
  
  q_h111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h113q, "==", :a_yes
  
  q_h111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h113q, "==", :a_yes
  
  q_h111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h113q, "==", :a_yes
  
  q_h114q "15. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_h114q, "==", :a_yes
  
  q_h111a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
  
  q_h111b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h114q, "==", :a_yes
    
  
  q_h115q "16. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h115a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h115q, "==", :a_yes
  
  q_h115b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h115q, "==", :a_yes
  
  q_h115c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h115q, "==", :a_yes
  
  q_h116q "17. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h116a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h116q, "==", :a_yes
  
  q_h116b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h116q, "==", :a_yes
  
  q_h116d "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h116q, "==", :a_yes
  
  q_h117q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h117cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h117q, "==", :a_yes
  
  q_h117dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h117q, "==", :a_yes
  
  q_h117d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h118q, "==", :a_yes
  
  q_h118q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_h118q, "==", :a_yes
  
  q_h118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h118q, "==", :a_yes
  
  q_h118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h118q, "==", :a_yes
  
  q_h119q "20. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_h119q, "==", :a_yes
  
  q_h119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h119q, "==", :a_yes
  
  q_h119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h120q, "==", :a_yes
    
  
  q_h120q "21.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_h120q, "==", :a_yes
  
  q_h120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h120q, "==", :a_yes
  
  q_h120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h120q, "==", :a_yes
  
  q_h120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h120q, "==", :a_yes
  
  q_h121q "22. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21cc1 "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h121q, "==", :a_yes
  
  q_h121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h121q, "==", :a_yes
  
  q_h121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h121q, "==", :a_yes
  
  q_h121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h121q, "==", :a_yes
  
  q_h121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h121q, "==", :a_yes
  
  q_h122q "23.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22cc1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_h122q, "==", :a_yes
  
  q_h122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h122q, "==", :a_yes
  
  q_h122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h122q, "==", :a_yes
  
  q_h1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h122q, "==", :a_yes
  
  q_h1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h122q, "==", :a_yes
  
  q_h123q "24.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h123q, "==", :a_yes
  
  q_h123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h123q, "==", :a_yes
  
  q_h123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h123q, "==", :a_yes
  
  q_h123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h123q, "==", :a_yes
  
  q_h123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h123q, "==", :a_yes
  
  q_h124q "25. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h124q, "==", :a_yes
  
  q_h124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h124q, "==", :a_yes
  
  q_h124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h124q, "==", :a_yes
  
  q_h124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h124q, "==", :a_yes
  
  q_h124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h124q, "==", :a_yes
    
  
  q_h125q "26. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_h125q, "==", :a_yes
  
  q_h125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_h125q, "==", :a_yes
  
  q_h125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_h125q, "==", :a_yes
  
  q_h125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h125q, "==", :a_yes
  
  q_h125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_h125q, "==", :a_yes
  
  q_h126q "27.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_h126q, "==", :a_yes
  
  q_h126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h126q, "==", :a_yes
  
  q_h127q "28. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_h127 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_h127q, "==", :a_yes
  
  q_h127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_h127q, "==", :a_yes
  
  q_h127ii "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h127qb, "==", :a_yes
  
  q_h127iii "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_h127qb, "==", :a_yes
end

section "Cattle" do
      
  q_ho11 "1. Breed:"
    a :string
  
  q_ho12 "2.Age:"
    a :string
  
  q_ho13 "3. Source acquired from:"
    a :text
  
  q_ho141q "4. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_sh1oe "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_ho141q, "==", :a_e
  
  q_sh155 "5. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "6. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"7.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_sh16a "a) Total number of animals justified "
    a :string
  
  q_sh16b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_sh16c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_sh16d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_sh17 "8.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_sh18 "9. where will the animals be housed?"
    a :string          
  
  q_sh1hh "10.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_sh1hh, "==", :a_yes      
  
  q_yes14b "11.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14b, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14b, "==", :a_yes
  
  q_sh11c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14b, "==", :a_yes
  
  q_sh11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14b, "==", :a_yes
  
  q_sh110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14b, "==", :a_yes
  
  q_sh11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh110e, "==", :a_yes
  
  q_sh11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh110e, "==", :a_yes
  
  q_sh11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh110e, "==", :a_yes
  
  q_sh1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14b, "==", :a_yes
  
  q_sh1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_sh1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiii1 "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_sh111q "12.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_sh111q, "==", :a_yes
  
  q_sh111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh111q, "==", :a_yes
  
  q_sh112q "13.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_sh112q, "==", :a_yes
  
  q_sh111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh112q, "==", :a_yes
  
  q_sh113q "14. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_sh113q, "==", :a_yes
  
  q_sh111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh113q, "==", :a_yes
  
  q_sh111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh113q, "==", :a_yes
  
  q_sh111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh113q, "==", :a_yes
  
  q_sh111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh113q, "==", :a_yes
  
  q_sh114q "15. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_sh114q, "==", :a_yes
  
  q_sh111a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111a23ii "ii. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
  
  q_sh111b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh114q, "==", :a_yes
          
  q_sh115q "16. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh115a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh115q, "==", :a_yes
  
  q_sh115b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh115q, "==", :a_yes
  
  q_sh115c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh115q, "==", :a_yes
  
  q_sh116q "17. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh116a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh116q, "==", :a_yes
  
  q_sh116b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh116q, "==", :a_yes
  
  q_sh116d "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh116q, "==", :a_yes
  
  q_sh117q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh117cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh117q, "==", :a_yes
  
  q_sh117dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh117q, "==", :a_yes
  
  q_sh117d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh118q, "==", :a_yes
  
  q_sh118q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_sh118q, "==", :a_yes
  
  q_sh118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh118q, "==", :a_yes
  
  q_sh118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh118q, "==", :a_yes
  
  q_sh119q "20. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_sh119q, "==", :a_yes
  
  q_sh119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh119q, "==", :a_yes
  
  q_sh119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh120q, "==", :a_yes
    
  q_sh120q "21.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_sh120q, "==", :a_yes
  
  q_sh120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh120q, "==", :a_yes
  
  q_sh120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh120q, "==", :a_yes
  
  q_sh120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh120q, "==", :a_yes
  
  q_sh121q "22. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21c "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh121q, "==", :a_yes
  
  q_sh121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh121q, "==", :a_yes
  
  q_sh121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh121q, "==", :a_yes
  
  q_sh121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh121q, "==", :a_yes
  
  q_sh121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh121q, "==", :a_yes
  
  q_sh122q "23.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c122 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh122q, "==", :a_yes
  
  q_sh122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh122q, "==", :a_yes
  
  q_sh122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh122q, "==", :a_yes
  
  q_sh1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh122q, "==", :a_yes
  
  q_sh1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh122q, "==", :a_yes
  
  q_sh123q "24.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh123q, "==", :a_yes
  
  q_sh123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh123q, "==", :a_yes
  
  q_sh123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh123q, "==", :a_yes
  
  q_sh123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh123q, "==", :a_yes
  
  q_sh123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh123q, "==", :a_yes
  
  q_sh124q "25. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh124q, "==", :a_yes
  
  q_sh124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh124q, "==", :a_yes
  
  q_sh124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh124q, "==", :a_yes
  
  q_sh124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh124q, "==", :a_yes
  
  q_sh124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh124q, "==", :a_yes
         
  q_sh125q "26. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_sh125q, "==", :a_yes
  
  q_sh125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh125q, "==", :a_yes
  
  q_sh125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_sh125q, "==", :a_yes
  
  q_sh125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh125q, "==", :a_yes
  
  q_sh125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh125q, "==", :a_yes
  
  q_sh126q "27.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh126q, "==", :a_yes
  
  q_sh126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh126q, "==", :a_yes
  
  q_sh127q "28. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_sh127 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_sh127q, "==", :a_yes
  
  q_sh127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_sh127q, "==", :a_yes
  
  q_sh127ii "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh127qb, "==", :a_yes
  
  q_sh127iii "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_sh127qb, "==", :a_yes
end

section "Horse" do
      
  q_ho11ho "1. Breed:"
    a :string
  
  q_ho122 "2.Age:"
    a :string
  
  q_ho133 "3. Source acquired from:"
    a :text
  
  q_ho144q "4. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_ho1oe "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_ho144q, "==", :a_e
  
  q_ho155 "5. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "6. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"7.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_ho16a "a) Total number of animals justified "
    a :string
  
  q_ho16b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_ho16c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_ho16d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_ho17 "8.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_ho18 "9. where will the animals be housed?"
    a :string
        
  
  q_ho1hh "10.  Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no  "No"

  q "a) Describe and justify"
    a :text
    dependency :rule=>"A"
    condition_A :q_ho1hh, "==", :a_yes
  
  
  q_yes14ho "11.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14ho, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14ho, "==", :a_yes
  
  q_ho11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14ho, "==", :a_yes
  
  q_ho11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14ho, "==", :a_yes
  
  q_ho110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14ho, "==", :a_yes
  
  q_ho11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho110e, "==", :a_yes
  
  q_ho11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho110e, "==", :a_yes
  
  q_ho11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho110e, "==", :a_yes
  
  q_ho1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14ho, "==", :a_yes
  
  q_ho1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_ho1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiiho "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_ho111q "12.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_ho111q, "==", :a_yes
  
  q_ho111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho111q, "==", :a_yes
  
  q_ho112q "13.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_ho112q, "==", :a_yes
  
  q_ho111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho112q, "==", :a_yes
  
  q_ho113q "14. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
      
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_ho113q, "==", :a_yes
  
  q_ho111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho113q, "==", :a_yes
  
  q_ho111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho113q, "==", :a_yes
  
  q_ho111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho113q, "==", :a_yes
  
  q_ho111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho113q, "==", :a_yes
  
  q_ho114q "15. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_ho114q, "==", :a_yes
  
  q_ho111a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111a23ii "ii. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes

  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
  
  q_ho111b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho114q, "==", :a_yes
          
  q_ho115q "16. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho115a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho115q, "==", :a_yes
  
  q_ho115b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho115q, "==", :a_yes
  
  q_ho115c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho115q, "==", :a_yes
  
  q_ho116q "17. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho116a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho116q, "==", :a_yes
  
  q_ho116b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho116q, "==", :a_yes
  
  q_ho116d "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho116q, "==", :a_yes
  
  q_ho117q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho117cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho117q, "==", :a_yes
  
  q_ho117dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho117q, "==", :a_yes
  
  q_ho117d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho118q, "==", :a_yes
  
  q_ho118q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_ho118q, "==", :a_yes
  
  q_ho118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho118q, "==", :a_yes
  
  q_ho118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho118q, "==", :a_yes
  
  q_ho119q "20. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_ho119q, "==", :a_yes
  
  q_ho119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho119q, "==", :a_yes
  
  q_ho119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho120q, "==", :a_yes
          
  q_ho120q "21.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_ho120q, "==", :a_yes
  
  q_ho120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho120q, "==", :a_yes
  
  q_ho120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho120q, "==", :a_yes
  
  q_ho120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho120q, "==", :a_yes
  
  q_ho121q "22. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21ho "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho121q, "==", :a_yes
  
  q_ho121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho121q, "==", :a_yes
  
  q_ho121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho121q, "==", :a_yes
  
  q_ho121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho121q, "==", :a_yes
  
  q_ho121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho121q, "==", :a_yes
  
  q_ho122q "23.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1ho "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho122q, "==", :a_yes
  
  q_ho122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho122q, "==", :a_yes
  
  q_ho122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho122q, "==", :a_yes
  
  q_ho1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho122q, "==", :a_yes
  
  q_ho1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho122q, "==", :a_yes
  
  q_ho123q "24.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho123q, "==", :a_yes
  
  q_ho123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho123q, "==", :a_yes
  
  q_ho123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho123q, "==", :a_yes
  
  q_ho123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho123q, "==", :a_yes
  
  q_ho123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho123q, "==", :a_yes
  
  q_ho124q "25. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho124q, "==", :a_yes
  
  q_ho124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho124q, "==", :a_yes
  
  q_ho124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho124q, "==", :a_yes
  
  q_ho124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho124q, "==", :a_yes
  
  q_ho124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho124q, "==", :a_yes
          
  q_ho125q "26. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_ho125q, "==", :a_yes
  
  q_ho125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho125q, "==", :a_yes
  
  q_ho125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_ho125q, "==", :a_yes
  
  q_ho125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho125q, "==", :a_yes
  
  q_ho125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho125q, "==", :a_yes
  
  q_ho126q "27.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho126q, "==", :a_yes
  
  q_ho126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho126q, "==", :a_yes
  
  q_ho127q "28. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ho127 "a) what physical method of euthanasia will be used?"
    a :string
    dependency :rule=>"A"
    condition_A :q_ho127q, "==", :a_yes
  
  q_ho127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_ho127q, "==", :a_yes
  
  q_ho127ii "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho127qb, "==", :a_yes
  
  q_ho127iii "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ho127qb, "==", :a_yes
end

section "Primates" do
      
  q_pr11ho "1. Species"
    a :string
      
  q_pr144q "2. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_pr1oe "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_pr144q, "==", :a_e
  
  q_pr155 "3. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "4. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"5.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_pr16a "a) Total number of animals justified "
    a :string
  
  q_pr16b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_pr16c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_pr16d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_pr17 "6.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_pr18 "7. where will the animals be housed?"
    a :string
        
  
  q_pr1hh "8.  Describe any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?"
    a :text
 
  
  q_yes14pr "9.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14pr, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_pr11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_pr11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_pr110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_pr11ieeee "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr110e, "==", :a_yes
  
  q_pr11iieeee "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr110e, "==", :a_yes
  
  q_pr11iiieee "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr110e, "==", :a_yes
  
  q_pr1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_pr1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_pr1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiiagr "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_pr111q "10.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_pr111q, "==", :a_yes
  
  q_pr11ea "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr111q, "==", :a_yes
  
  q_pr112q "11.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_pr112q, "==", :a_yes
  
  q_pr111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr112q, "==", :a_yes
  
  q_pr113q "12. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_pr113q, "==", :a_yes
  
  q_pr111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113q, "==", :a_yes
  
  q_pr111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113q, "==", :a_yes
  
  q_pr111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113q, "==", :a_yes
  
  q_pr111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113q, "==", :a_yes
  
  q_pr114q "13. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_pr114q, "==", :a_yes
  
  q_pr111a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111a23ii "ii. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111eiii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes

  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr1a3eib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
  
  q_pr111b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114q, "==", :a_yes
    
  
  q_pr115q "14. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr115a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr115q, "==", :a_yes
  
  q_pr115b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr115q, "==", :a_yes
  
  q_pr115c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr115q, "==", :a_yes
  
  q_pr116q "15. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr116a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr116q, "==", :a_yes
  
  q_pr116b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr116q, "==", :a_yes
  
  q_pr116d "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr116q, "==", :a_yes
  
  q_pr117q "16. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr117cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr117q, "==", :a_yes
  
  q_pr117dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr117q, "==", :a_yes
  
  q_pr117d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr118q, "==", :a_yes
  
  q_pr118q "17. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_pr118q, "==", :a_yes
  
  q_pr118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr118q, "==", :a_yes
  
  q_pr118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr118q, "==", :a_yes
  
  q_pr119q "18. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_pr119q, "==", :a_yes
  
  q_pr119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119q, "==", :a_yes
  
  q_pr119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120q, "==", :a_yes
          
  q_pr120q "19.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_pr120q, "==", :a_yes
  
  q_pr120eb "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120q, "==", :a_yes
  
  q_pr120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120q, "==", :a_yes
  
  q_pr120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120q, "==", :a_yes
  
  q_pr121q "20. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat1r21pr "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr121q, "==", :a_yes
  
  q_pr121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121q, "==", :a_yes
  
  q_pr121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121q, "==", :a_yes
  
  q_pr121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121q, "==", :a_yes
  
  q_pr121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121q, "==", :a_yes
  
  q_pr122q "21.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1pr "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr122q, "==", :a_yes
  
  q_pr122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122q, "==", :a_yes
  
  q_pr122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122q, "==", :a_yes
  
  q_pr122e4 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122q, "==", :a_yes
  
  q_pr1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122q, "==", :a_yes
  
  q_pr123q "22.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr123an "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr123q, "==", :a_yes
  
  q_pr123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123q, "==", :a_yes
  
  q_pr123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123q, "==", :a_yes
  
  q_pr123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123q, "==", :a_yes
  
  q_pr123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123q, "==", :a_yes
  
  q_pr124q "23. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr124q, "==", :a_yes
  
  q_pr124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124q, "==", :a_yes
  
  q_pr124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124q, "==", :a_yes
  
  q_pr124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124q, "==", :a_yes
  
  q_pr124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124q, "==", :a_yes
          
  q_pr125q "24. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_pr125q, "==", :a_yes
  
  q_pr125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr125q, "==", :a_yes
  
  q_pr125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr125q, "==", :a_yes
  
  q_pr125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr125q, "==", :a_yes
  
  q_pr125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr125q, "==", :a_yes
  
  q_pr126q "25.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr126cg "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr126q, "==", :a_yes
  
  q_pr126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr126q, "==", :a_yes
  
  q_pr127q "26. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr127 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_pr127q, "==", :a_yes
end

section "Agriculture Research" do
      
  q_agr11ho "1. Species"
    a :string
  
  q_agr12ho "2. Breed"
    a :string
  
  q_agr13ho "3. who owns the animals"
    a :string
          
  q_agr144q "4. Rationale for using this Species:", :pick => :one
    a_b1 "a)A large amount of relevant data has already been derived from this species"
    a_d "b)The studies are species specific for analysis related to management, behavior, agroduction, etc."
    a_e "c)Other,If you checked 'Other' explain:"
  
  q_agr1oe "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_agr144q, "==", :a_e
  
  q_agr155 "5. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "6. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"7.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_agr16a "a) Total number of animals justified "
    a :string
  
  q_agr16b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_agr16c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_agr16d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_agr17 "8.  Describe any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?"
    a :text
  
  q_agr18 "9. where will the animals be housed?"
    a :string
  
  q_agr11q "10.  Who is responsible for animal care?"
    a :string
  
  q_agrq1 "a)What is the source of food and water?"
    a :string
  
  q_agr1q "b)How often is the food/water source checked?"
    a :string
  
  q_agrq "c)Describe and other specialized housing/husbandry:"
    a :string
  
  q_yes14agr "11.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14agr, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14agr, "==", :a_yes
  
  q_agr11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14agr, "==", :a_yes
  
  q_agr11d "d)Location where the procedure will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14agr, "==", :a_yes
  
  q_agr110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14agr, "==", :a_yes
  
  q_agr11i "i) Describe the practices that will be used to ensure asepsis:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr110e, "==", :a_yes
  
  q_agr11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr110e, "==", :a_yes
  
  q_agr11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr110e, "==", :a_yes
  
  q_agr1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14agr, "==", :a_yes
  
  q_agr1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_agr1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiagr "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_agr111q "12.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_agr111q, "==", :a_yes
  
  q_agr111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes

  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr111q, "==", :a_yes
  
  q_agr112q "13.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_agr112q, "==", :a_yes
  
  q_agr111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr112q, "==", :a_yes
  
  q_agr113q "14. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_agr113q, "==", :a_yes
  
  q_agr111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr113q, "==", :a_yes
  
  q_agr111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr113q, "==", :a_yes
  
  q_agr111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr113q, "==", :a_yes
  
  q_agr111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr113q, "==", :a_yes
  
  q_agr114q "15. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_agr114q, "==", :a_yes
  
  q_agr111a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111a23ii "ii. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
  
  q_agr111b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr114q, "==", :a_yes
          
  q_agr115q "16. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr115a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr115q, "==", :a_yes
  
  q_agr115b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr115q, "==", :a_yes
  
  q_agr115c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr115q, "==", :a_yes
  
  q_agr116q "17. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr116a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr116q, "==", :a_yes
  
  q_agr116b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr116q, "==", :a_yes
  
  q_agr116d "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr116q, "==", :a_yes
  
  q_agr117q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr117cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr117q, "==", :a_yes
  
  q_agr117dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr117q, "==", :a_yes
  
  q_agr117d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr118q, "==", :a_yes
  
  q_agr118q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_agr118q, "==", :a_yes
  
  q_agr118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr118q, "==", :a_yes
  
  q_agr118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr118q, "==", :a_yes
  
  q_agr119q "20. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_agr119q, "==", :a_yes
  
  q_agr119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr119q, "==", :a_yes
  
  q_agr119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr120q, "==", :a_yes
          
  q_agr120q "21.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_agr120q, "==", :a_yes
  
  q_agr120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr120q, "==", :a_yes
  
  q_agr120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr120q, "==", :a_yes
  
  q_agr120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr120q, "==", :a_yes
  
  q_agr121q "22. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21agr2 "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr121q, "==", :a_yes
  
  q_agr121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr121q, "==", :a_yes
  
  q_agr121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr121q, "==", :a_yes
  
  q_agr121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr121q, "==", :a_yes
  
  q_agr121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr121q, "==", :a_yes
  
  q_agr122q "23.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1agr "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr122q, "==", :a_yes
  
  q_agr122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr122q, "==", :a_yes
  
  q_agr122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr122q, "==", :a_yes
  
  q_agr1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr122q, "==", :a_yes
  
  q_agr1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr122q, "==", :a_yes
  
  q_agr123q "24.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr123q, "==", :a_yes
  
  q_agr123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr123q, "==", :a_yes
  
  q_agr123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr123q, "==", :a_yes
  
  q_agr123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr123q, "==", :a_yes
  
  q_agr123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr123q, "==", :a_yes
  
  q_agr124q "25. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr124q, "==", :a_yes
  
  q_agr124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr124q, "==", :a_yes
  
  q_agr124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr124q, "==", :a_yes
  
  q_agr124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr124q, "==", :a_yes
  
  q_agr124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr124q, "==", :a_yes
          
  q_agr125q "26. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_agr125q, "==", :a_yes
  
  q_agr125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr125q, "==", :a_yes
  
  q_agr125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_agr125q, "==", :a_yes
  
  q_agr125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr125q, "==", :a_yes
  
  q_agr125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr125q, "==", :a_yes
  
  q_agr126q "27.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_agr126q, "==", :a_yes
  
  q_agr126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr126q, "==", :a_yes
  
  q_agr127q "28. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr127 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_agr127q, "==", :a_yes
  
  q_agr127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_agr127q, "==", :a_yes
  
  q_agr127ii "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr127qb, "==", :a_yes
  
  q_agr127iii "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_agr127qb, "==", :a_yes
end

section "Primates" do
        
  q_pr11hos "1. Species"
    a :string
          
  q_pr144q1 "2. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_pr1oee "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_pr144q1, "==", :a_e

  
  q_pr135 "3. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "4. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"5.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_pr16ae "a) Total number of animals justified "
    a :string
  
  q_pr16bee  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_pr16ce  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_pr16de  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_pr17ee "6.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_pr18ee "7. where will the animals be housed?"
    a :string
        
  
  q_pr1hh8 "8.  Describe any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?"
    a :text
 
  
  q_yes14pre "9.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14pre, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14pre, "==", :a_yes
  
  q_pr11c1e "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14pre, "==", :a_yes
  
  q_pr11dee "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14pre, "==", :a_yes
  
  q_pr1e10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14pre, "==", :a_yes
  
  q_pr11ieee "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr1e10e, "==", :a_yes
  
  q_pr11iieee "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr1e10e, "==", :a_yes
  
  q_pr1wii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr1e10e, "==", :a_yes
  
  q_pr1fqe "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14pre, "==", :a_yes
  
  q_pr1fei "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_pr1feii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiagre "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_pr111eq "10.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_pr111eq, "==", :a_yes
  
  q_pr111aee "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_prea22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pr1e33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pre111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pre111be2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pr1eb3e "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pre111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pr11cec "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pr11ddee "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr111eq, "==", :a_yes
  
  q_pr112eq "11.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
      
  label "a) induction"
   dependency :rule=>"A"
    condition_A :q_pr112eq, "==", :a_yes
  
  q_pr111a2ee "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pr111a22ee "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pr111a32ee "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pre111b42e "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pr112be "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pr112ec "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr112eq, "==", :a_yes
  
  q_pr113eq "12. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_pr113eq, "==", :a_yes
  
  q_pr111a3re "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113eq, "==", :a_yes
  
  q_pr111a23ee "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113eq, "==", :a_yes
  
  q_pr111a33ee "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113eq, "==", :a_yes
  
  q_pre111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr113eq, "==", :a_yes
  
  q_pr114qe "13. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_pr114qe, "==", :a_yes
  
  q_pr111a3ie "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr1ea23ii "ii. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr111a33iiiee "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr1eb43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pre111b43vae "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pre111b43vie "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr111a3ieb "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr1ea23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr111a33iiibe "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pr1eb43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
  
  q_pre111b43vabe "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr114qe, "==", :a_yes
    
  q_pr115qe "14. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr115ea "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr115qe, "==", :a_yes
  
  q_pr115be "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr115qe, "==", :a_yes
  
  q_pr115ec "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr115qe, "==", :a_yes
  
  q_pr116qt "15. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr116ai "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr116qt, "==", :a_yes
  
  q_pr116be "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr116qt, "==", :a_yes
  
  q_pr116de "c) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr116qt, "==", :a_yes
  
  q_pr117qe "16. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr117cce "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr117qe, "==", :a_yes
  
  q_pr117dde "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr117qe, "==", :a_yes
  
  q_pr1e7d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr117qe, "==", :a_yes
  
  q_pr118qe "17. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr118ea "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_pr118qe, "==", :a_yes
  
  q_pr118be "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr118qe, "==", :a_yes
  
  q_pr118ec "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr118qe, "==", :a_yes
  
  q_pr119qe "18. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr119ae "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_pr119qe, "==", :a_yes
  
  q_pr119eb "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr119ie "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr1w9ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr119ec "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr119ed "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr11e9ed "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
  
  q_pr119fe "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr119qe, "==", :a_yes
        
  q_pr120qe "19.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr120aec "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_pr120qe, "==", :a_yes
  
  q_pr120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120qe, "==", :a_yes
  
  q_pr12ec1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120qe, "==", :a_yes
  
  q_pr120de "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr120qe, "==", :a_yes
  
  q_pr121qt "20. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r21prn "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr121qt, "==", :a_yes
  
  q_pr121ea "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121qt, "==", :a_yes
  
  q_pr121b1r "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121qt, "==", :a_yes
  
  q_pr121be2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121qt, "==", :a_yes
  
  q_pr121de "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr121qt, "==", :a_yes
  
  q_pr122qe "21.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1pre "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr122qe, "==", :a_yes
  
  q_pr122c2e "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122qe, "==", :a_yes
  
  q_pr122c3e "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122qe, "==", :a_yes
  
  q_pr1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122qe, "==", :a_yes
  
  q_pr122e5 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr122qe, "==", :a_yes
  
  q_pr123qe "22.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr123qe, "==", :a_yes
  
  q_pr123be "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123qe, "==", :a_yes
  
  q_pr123ce "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123qe, "==", :a_yes
  
  q_pr123de "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123qe, "==", :a_yes
  
  q_pr123fle "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr123qe, "==", :a_yes
  
  q_pr124qe "23. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr124ce "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr124qe, "==", :a_yes
  
  q_pr124c1e "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124qe, "==", :a_yes
  
  q_pr124c2e "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124qe, "==", :a_yes
  
  q_pr124c3e "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124qe, "==", :a_yes
  
  q_pr124c4e "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr124qe, "==", :a_yes
          
  q_pr125qe "24. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr125cea "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_pr125qe, "==", :a_yes
  
  q_pr125cbe "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr125qe, "==", :a_yes
  
  q_pr125cec "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_pr125qe, "==", :a_yes
  
  q_pr125cde "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr125qe, "==", :a_yes
  
  q_pr125cef "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr125qe, "==", :a_yes
  
  q_pr126qe "25.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_pr126qe, "==", :a_yes
  
  q_pr126ce1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_pr126qe, "==", :a_yes
  
  q_pr127qe "26. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_pr12e7 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_pr127qe, "==", :a_yes
end

section "Laboartory Held Fish and Amphibians" do
      
  q_lhf11ho "1. Species"
    a :string
  
  q_lhf11h "2. Age or weight:"
    a :string
  
  q_lhf144q "3. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_lhf1oe "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_lhf144q, "==", :a_e

  
  q_lhf155 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    answer "e) This protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    answer "f)This protocol is a teaching or training"
    answer "g) Other experimental design or justification"

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_lhf16a "a) Total number of animals justified "
    a :string
  
  q_lhf16b  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_lhf16c  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_lhf16d  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_lhf17 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_lhf18 "8. where will the animals be housed?"
    a :string
  
  q_yeg99 "9. Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a)Describe and justify:"
    a :text
    dependency :rule=>"A"
    condition_A :q_yeg99, "==", :a_yes
  
  q_yes14per2 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes14per2, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_yes14per2, "==", :a_yes
  
  q_lhf11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14per2, "==", :a_yes
  
  q_lhf11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_yes14pr, "==", :a_yes
  
  q_lhf110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14per2, "==", :a_yes
  
  q_lhf11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf110e, "==", :a_yes
  
  q_lhf11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf110e, "==", :a_yes
  
  q_lhf11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf110e, "==", :a_yes
  
  q_lhf1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_yes14per2, "==", :a_yes
  
  q_lhf1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_lhf1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_rfiager "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_lhf111q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_lhf111q, "==", :a_yes
  
  q_lhf111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf111q, "==", :a_yes
  
  q_lhf112q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_lhf112q, "==", :a_yes
  
  q_lhf111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf112q, "==", :a_yes
  
  q_lhf113q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_lhf113q, "==", :a_yes
  
  q_lhf111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf113q, "==", :a_yes
  
  q_lhf111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf113q, "==", :a_yes
  
  q_lhf111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf113q, "==", :a_yes
  
  q_lhf111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf113q, "==", :a_yes
  
  q_lhf114q "14. Will samples be collect from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf14a "a)Descibe the sample collection method(s).  Note that anesthesia is required for a terminal bleed and/or cardiac puncture."
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf114q, "==", :a_yes
  
  q_lhf118q "15. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf118a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf118q, "==", :a_yes
  
  q_lhf118b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf118q, "==", :a_yes
  
  q_lhf118c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf118q, "==", :a_yes
  
  q_lhf119q "16. Is food restriction required for the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf119a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf119q, "==", :a_yes
  
  q_lhf119b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf119q, "==", :a_yes
  
  q_lhf119f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf120q, "==", :a_yes
          
  q_lhf120q "17.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf120ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf120q, "==", :a_yes
  
  q_lhf120b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf120q, "==", :a_yes
  
  q_lhf120c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf120q, "==", :a_yes
  
  q_lhf120d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf120q, "==", :a_yes
  
  q_lhf121q "18. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gpur21p "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf121q, "==", :a_yes
  
  q_lhf121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf121q, "==", :a_yes
  
  q_lhf121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf121q, "==", :a_yes
  
  q_lhf121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf121q, "==", :a_yes
  
  q_lhf121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf121q, "==", :a_yes
  
  q_lhf122q "19. Will recombinant DNA by administered", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1per "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf122q, "==", :a_yes
  
  q_lhf122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122q, "==", :a_yes
  
  q_lhf122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122q, "==", :a_yes
  
  q_lhf1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122q, "==", :a_yes
  
  q_lhf1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122q, "==", :a_yes
  
  q_lhf123qe "20.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf123qe, "==", :a_yes
  
  q_lhf123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123qe, "==", :a_yes
  
  q_lhf123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123qe, "==", :a_yes
  
  q_lhf123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123qe, "==", :a_yes
  
  q_lhf123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123qe, "==", :a_yes
  
  q_lhf124q "21. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf124q, "==", :a_yes
  
  q_lhf124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124q, "==", :a_yes
  
  q_lhf124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124q, "==", :a_yes
  
  q_lhf124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124q, "==", :a_yes
  
  q_lhf124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124q, "==", :a_yes
          
  q_lhf125q "22. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf125cae "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf125q, "==", :a_yes
  
  q_lhf125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf125q, "==", :a_yes
  
  q_lhf125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf125q, "==", :a_yes
  
  q_lhf125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf125q, "==", :a_yes
  
  q_lhf125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf125q, "==", :a_yes
  
  q_lhf126q "23.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf126q, "==", :a_yes
  
  q_lhf126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf126q, "==", :a_yes
  
  q_lhf127qee "24. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr12e7 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf127qee, "==", :a_yes
  
  q_ag127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_lhf127qee, "==", :a_yes
  
  q_agr12e7iei "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ag127qb, "==", :a_yes
  
  q_agr12e7ie "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_ag127qb, "==", :a_yes
  
  q_lhf122qe "22. Will recombinant DNA by administered", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_r22c1epr "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf122qe, "==", :a_yes
  
  q_lhf122c2e "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122qe, "==", :a_yes
  
  q_lhf12ec3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122qe, "==", :a_yes
  
  q_lhf12e4 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122qe, "==", :a_yes
  
  q_lhf122e5 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf122qe, "==", :a_yes
  
  q_lhf123q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf12e3a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf123q, "==", :a_yes
  
  q_lhf123ble "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123q, "==", :a_yes
  
  q_lhf123ec "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123q, "==", :a_yes
  
  q_lhf123ed "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123q, "==", :a_yes
  
  q_lhf123ef "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf123q, "==", :a_yes
  
  q_lhf124qe "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf124ec "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf124qe, "==", :a_yes
  
  q_lhf124ec1e "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124qe, "==", :a_yes
  
  q_lhf124ec2e "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124qe, "==", :a_yes
  
  q_lhf124ec3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124qe, "==", :a_yes
  
  q_lhf124c4e "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf124qe, "==", :a_yes
          
  q_lhf125qe "26. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf125ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_lhf125qe, "==", :a_yes
  
  q_lhf125ceb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf125qe, "==", :a_yes
  
  q_lhf125cce "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_lhf125qe, "==", :a_yes
  
  q_lhf125ced "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf125qe, "==", :a_yes
  
  q_lhf125ce2 "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf125qe, "==", :a_yes
  
  q_lhf126qe "27.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_lhf126cee "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_lhf126qe, "==", :a_yes
  
  q_lhf126c1e "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_lhf126qe, "==", :a_yes
  
  q_lhf127q2 "28. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_agr127ee "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_agr127q, "==", :a_yes
  
  q_agr17qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_agr127q, "==", :a_yes  
end

section "Guinea Pig" do
          
  q_gup11ho "1. Strain(s):"
        a :string
      
  q_gup11h "2. Age or weight:"
        a :string
      
  q_gup144q "3. Rationale for using this Species:", :pick => :one
        a_a "a)There is demonostrated similarity of the process under study to that of humans"
        a_b1 "b)A large amount of relevant data has already been derived from this species"
        a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
        a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
        a_e "e)Other,If you checked 'Other' explain:"
      
  q_gup1oe1 "If you checked 'Other' explain:"
        a_1 :text
        dependency :rule=>"Z"
        condition_Z :q_gup144q, "==", :a_e
  
  q_gup155 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  
  q_gup2 "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    a_e1 "e) The protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    a_e2 "f) This protocol is a teaching or training protocol."
    a_e3 "g) Other experimental design or justification"
  
  q_gup1oep "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_gup2, "==", :a_e1
  
  q_gup1oeg "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_gup2, "==", :a_e2
  
  q_gup1oeu "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_gup2, "==", :a_e3

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_gup16a1 "a) Total number of animals justified "
    a :string
  
  q_gup16b2  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_gup16c3  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_gup16d4  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_gup17 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_gup18 "8. where will the animals be housed?"
    a :string
  
  q_ye99 "9. Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a)Describe and justify:"
    a :text
    dependency :rule=>"A"
    condition_A :q_ye99, "==", :a_yes
  
  q_gupyes2 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_gupyes2, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gupyes2, "==", :a_yes
  
  q_gup11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gupyes2, "==", :a_yes
  
  q_gup11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gupyes2, "==", :a_yes
  
  q_gup110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_gupyes2, "==", :a_yes
  
  q_gup11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup110e, "==", :a_yes
  
  q_gup11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup110e, "==", :a_yes
  
  q_gup11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup110e, "==", :a_yes
  
  q_gup1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_gupyes2, "==", :a_yes
  
  q_gup1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_gup1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_guprfer "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_gup111q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_gup111q, "==", :a_yes
  
  q_gup111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes

  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup111q, "==", :a_yes
  
  q_gup112q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_gup112q, "==", :a_yes
  
  q_gup111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup112q, "==", :a_yes
  
  q_gup113q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_gup113q, "==", :a_yes
  
  q_gup111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup113q, "==", :a_yes
  
  q_gup111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup113q, "==", :a_yes
  
  q_gup111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup113q, "==", :a_yes
  
  q_gup111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup113q, "==", :a_yes
  
  q_gup14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_gup14q, "==", :a_yes
  
  q_gup11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes

  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11b43ivb "iv. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup14q, "==", :a_yes
  
  q_gup16q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup16a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup16q, "==", :a_yes
  
  q_gup16b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup16q, "==", :a_yes
  
  q_gup16c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup16q, "==", :a_yes
  
  q_gup17q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup17a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup17q, "==", :a_yes
  
  q_gup17b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup17q, "==", :a_yes
  
  q_gup17c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup17q, "==", :a_yes
  
  q_gup17d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup17q, "==", :a_yes
  
  q_gup17d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup17q, "==", :a_yes
  
  q_gup17qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_gup17q, "==", :a_yes
  
  q_gup17e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup17qe, "==", :a_yes
  
  q_gup18q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup18q, "==", :a_yes
  
  q_gup17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup18q, "==", :a_yes
  
  q_gup17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup18q, "==", :a_yes
  
  q_gup19q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup19a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_gup19q, "==", :a_yes
  
  q_gup19b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup19q, "==", :a_yes
  
  q_gup19c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup19q, "==", :a_yes
  
  q_gup20q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup20a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_gup20q, "==", :a_yes
  
  q_gup20b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup20f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup20q, "==", :a_yes
  
  q_gup22q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup22ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_gup22q, "==", :a_yes
  
  q_gup22b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup22q, "==", :a_yes
  
  q_gup22c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup22q, "==", :a_yes
  
  q_gup22d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup22q, "==", :a_yes
  
  q_gup121q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gpur21pr "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup121q, "==", :a_yes
  
  q_gup121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup121q, "==", :a_yes
  
  q_gup121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup121q, "==", :a_yes
  
  q_gup121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup121q, "==", :a_yes
  
  q_gup121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup121q, "==", :a_yes
  
  q_gup122q "22. Will recombinant DNA by administered", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gpu22c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup122q, "==", :a_yes
  
  q_gup122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup122q, "==", :a_yes
  
  q_gup122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup122q, "==", :a_yes
  
  q_gup1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup122q, "==", :a_yes
  
  q_gup1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup122q, "==", :a_yes
  
  q_gup123qe "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup123qe, "==", :a_yes
  
  q_gup123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup123qe, "==", :a_yes
  
  q_gup123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup123qe, "==", :a_yes
  
  q_gup123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup123qe, "==", :a_yes
  
  q_gup123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup123qe, "==", :a_yes
  
  q_gup124q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup124q, "==", :a_yes
  
  q_gup124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup124q, "==", :a_yes
  
  q_gup124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup124q, "==", :a_yes
  
  q_gup124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup124q, "==", :a_yes
  
  q_gup124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup124q, "==", :a_yes
          
  q_gup125q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup125cae "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_gup125q, "==", :a_yes
  
  q_gup125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup125q, "==", :a_yes
  
  q_gup125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_gup125q, "==", :a_yes
  
  q_gup125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup125q, "==", :a_yes
  
  q_gup125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup125q, "==", :a_yes
  
  q_gup126q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gup126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_gup126q, "==", :a_yes
  
  q_gup126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup126q, "==", :a_yes
  
  q_gup127qee "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gpu12e7 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_gup127qee, "==", :a_yes
  
  q_gup127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_gup127qee, "==", :a_yes
  
  q_gpu12e7iei "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup127qb, "==", :a_yes
  
  q_gpu12e7ie "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_gup127qb, "==", :a_yes   
end

section "Ferrets" do
      
  q_fer11ho "1. Strain(s):"
    a :string
  
  q_fer11h "2. Age or weight:"
    a :string
  
  q_fer144q "3. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_fer1oe1 "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_fer144q, "==", :a_e
  
  q_fer155 "4. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  
  q_fer2 "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    a_e1 "e) The protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    a_e2 "f) This protocol is a teaching or training protocol."
    a_e3 "g) Other experimental design or justification"
  
  q_fer1oep "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_fer2, "==", :a_e1
  
  q_fer1oeg "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_fer2, "==", :a_e2
  
  q_fer1oeu "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_fer2, "==", :a_e3

  label :"6.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_fer16a1 "a) Total number of animals justified "
    a :string
  
  q_fer16b2  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_fer16c3  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_fer16d4  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_fer17 "7.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_fer18 "8. where will the animals be housed?"
    a :string
  
  q_fer99 "9. Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a)Describe and justify:"
    a :text
    dependency :rule=>"A"
    condition_A :q_ye99, "==", :a_yes
  
  q_feryes2 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_feryes2, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_feryes2, "==", :a_yes
  
  q_fer11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_feryes2, "==", :a_yes
  
  q_fer11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_feryes2, "==", :a_yes
  
  q_fer110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_feryes2, "==", :a_yes
  
  q_fer11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer110e, "==", :a_yes
  
  q_fer11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer110e, "==", :a_yes
  
  q_fer11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer110e, "==", :a_yes
  
  q_fer1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_feryes2, "==", :a_yes
  
  q_fer1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_fer1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_ferrfer "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_fer111q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_fer111q, "==", :a_yes
  
  q_fer111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes

  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer111q, "==", :a_yes
  
  q_fer112q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_fer112q, "==", :a_yes
  
  q_fer111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer112q, "==", :a_yes
  
  q_fer113q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_fer113q, "==", :a_yes
  
  q_fer111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer113q, "==", :a_yes
  
  q_fer111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer113q, "==", :a_yes
  
  q_fer111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer113q, "==", :a_yes
  
  q_fer111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer113q, "==", :a_yes
  
  q_fer14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_fer14q, "==", :a_yes
  
  q_fer11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes

  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11b43ivb "iv. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer14q, "==", :a_yes
  
  q_fer16q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer16a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer16q, "==", :a_yes
  
  q_fer16b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer16q, "==", :a_yes
  
  q_fer16c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer16q, "==", :a_yes
  
  q_fer17q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer17a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer17q, "==", :a_yes
  
  q_fer17b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer17q, "==", :a_yes
  
  q_fer17c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer17q, "==", :a_yes
  
  q_fer17d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer17q, "==", :a_yes
  
  q_fer17d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer17q, "==", :a_yes
  
  q_fer17qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_fer17q, "==", :a_yes
  
  q_fer17e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer17qe, "==", :a_yes
  
  q_fer18q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer18q, "==", :a_yes
  
  q_fer17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer18q, "==", :a_yes
  
  q_fer17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer18q, "==", :a_yes
  
  q_fer19q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer19a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_fer19q, "==", :a_yes
  
  q_fer19b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer19q, "==", :a_yes
  
  q_fer19c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer19q, "==", :a_yes
  
  q_fer20q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer20a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_fer20q, "==", :a_yes
  
  q_fer20b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer20f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer20q, "==", :a_yes
  
  q_fer22q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer22ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_fer22q, "==", :a_yes
  
  q_fer22b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer22q, "==", :a_yes
  
  q_fer22c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer22q, "==", :a_yes
  
  q_fer22d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer22q, "==", :a_yes
  
  q_fer121q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_ferr21pr "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer121q, "==", :a_yes
  
  q_fer121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer121q, "==", :a_yes
  
  q_fer121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer121q, "==", :a_yes
  
  q_fer121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer121q, "==", :a_yes
  
  q_fer121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer121q, "==", :a_yes
  
  q_fer122q "22. Will recombinant DNA by administered", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer22c2 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer122q, "==", :a_yes
  
  q_fer122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer122q, "==", :a_yes
  
  q_fer122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer122q, "==", :a_yes
  
  q_fer1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer122q, "==", :a_yes
  
  q_fer1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer122q, "==", :a_yes
  
  q_fer123qe "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer123qe, "==", :a_yes
  
  q_fer123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer123qe, "==", :a_yes
  
  q_fer123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer123qe, "==", :a_yes
  
  q_fer123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer123qe, "==", :a_yes
  
  q_fer123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer123qe, "==", :a_yes
  
  q_fer124q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer124q, "==", :a_yes
  
  q_fer124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer124q, "==", :a_yes
  
  q_fer124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer124q, "==", :a_yes
  
  q_fer124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer124q, "==", :a_yes
  
  q_fer124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer124q, "==", :a_yes
          
  q_fer125q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer125cae "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_fer125q, "==", :a_yes
  
  q_fer125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer125q, "==", :a_yes
  
  q_fer125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"B"       
    condition_B :q_fer125q, "==", :a_yes
  
  q_fer125cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer125q, "==", :a_yes
  
  q_fer125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer125q, "==", :a_yes
  
  q_fer126q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_fer126q, "==", :a_yes
  
  q_fer126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer126q, "==", :a_yes
  
  q_fer127qee "27. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_fer12e7 "a) What physical method of euthanasia will be used?  *Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_fer127qee, "==", :a_yes
  
  q_fer127qb "b) will the animlas be under sedation or anesthesia at the time of euthanasia?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_fer127qee, "==", :a_yes
  
  q_fer12e7iei "i. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer127qb, "==", :a_yes
  
  q_fer12e7ie "ii. What training have been provided?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_fer127qb, "==", :a_yes
end

section "Cats" do
  q_cat11ho "1. Strain(s):"
    a :string
  
  q_cat144q "2. Rationale for using this Species:", :pick => :one
    a_a "a)There is demonostrated similarity of the process under study to that of humans"
    a_b1 "b)A large amount of relevant data has already been derived from this species"
    a_c "c)The maniulations (e.g. surgery) require an animal of at least this size"
    a_d "d)The studies are species specific for analysis related to management, behavior, production, etc."
    a_e "e)Other,If you checked 'Other' explain:"
  
  q_cat1oe1 "If you checked 'Other' explain:"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_cat144q, "==", :a_e

  
  q_cat155 "3. Describe, in chronological order, all procedures that will include the use of animals:  *Note:  This description should allow the IACUC to understand the experimental course of an animal from its entry into the experiment to the endpoint of the study"
    a :text        
  
  q_cat2 "4. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :any
    answer "a)Animals will be assigned to experimental groups.  Provide statistical or equivalent justification for the number of groups and number of animals per group Justify:"
    answer "b) The procedures are technically difficult, and extra animals will be needed to replace failure of the experiment.  Explain:"
    answer "c)This experiement is for obtaining pilot data that will be used to develop or learn new procedures or provide data for planning future studies.  Explain:"
    answer "d) The experiment requires antibody production or a specific amount of tissue or number of cells for work in vitro"
    a_e1 "e) The protocol requires breeding to develop a transgenic model or maintaining a breeding colony"
    a_e2 "f) This protocol is a teaching or training protocol."
    a_e3 "g) Other experimental design or justification"
  
  q_cat1oep "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_cat2, "==", :a_e1
  
  q_cat1oeg "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_cat2, "==", :a_e2
  
  q_cat1oeu "Explaination"
    a_1 :text
    dependency :rule=>"Z"
    condition_Z :q_cat2, "==", :a_e3

  label :"5.  Animal Numbers: *Note: Should be listed for the 3 year duration of the protocol. *Attention: Please only include numeric values.  Commas are not allowed"
  
  q_cat16a1 "a) Total number of animals justified "
    a :string
  
  q_cat16b2  "b) Category C Minimal, transient, or no pain/distress"
    a :string
  
  q_cat16c3  "c)Category D: pain/distress relieved by appropriate measures"
    a :string
  
  q_cat16d4  "d) Category E: unrelieved pain/distress"
    a :string
  
  q_cat17 "6.  Describe the most commonly recognized signs or side effects the animals may experience in reponse to the proposed experiment.  What, if anything, can be done to alleviate these clinical signs?  How will animals be monitored for an adverse reaction (including frequency of monitoring)?"
    a :text
  
  q_cat18 "7. where will the animals be housed?"
    a :string
  
  q_cat99 "8. Will any specialized housing and/or husbandry be required (special diets, single housing, metabolic cages, etc.)?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a)Describe and justify:"
    a :text
    dependency :rule=>"A"
    condition_A :q_cat99, "==", :a_yes
    
  
  q_catyes2 "9.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_catyes2, "==", :a_yes
  q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_catyes2, "==", :a_yes
  
  q_cat11c1 "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_catyes2, "==", :a_yes
  
  q_cat11d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_catyes2, "==", :a_yes
  
  q_cat110e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"      
    condition_B :q_catyes2, "==", :a_yes
  
  q_cat11i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat110e, "==", :a_yes
  
  q_cat11ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat110e, "==", :a_yes
  
  q_cat11iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat110e, "==", :a_yes
  
  q_cat1fq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_catyes2, "==", :a_yes
  
  q_cat1fi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :hfq, "==", :a_yes
  
  q_cat1fii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"B"       
    condition_B :rfq, "==", :a_yes
  
  q_catrfer "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"B"       
    condition_B :hfq, "==", :a_yes
  
  q_cat111q "10.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_cat111q, "==", :a_yes
  
  q_cat111a "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111a22a "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111a33b1 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes

  label "b) Maintenance"
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111b "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111b2 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111b3 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat111b4 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat11cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat11dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat111q, "==", :a_yes
  
  q_cat112q "11.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) induction"
    dependency :rule=>"A"
    condition_A :q_cat112q, "==", :a_yes
  
  q_cat111a2 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat111a22 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat111a32 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat111b42 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat112b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat112c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat112q, "==", :a_yes
  
  q_cat113q "12. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_cat113q, "==", :a_yes
  
  q_cat111a3 "agent"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat113q, "==", :a_yes
  
  q_cat111a23 "does (mg/kg):"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat113q, "==", :a_yes
  
  q_cat111a33 "route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat113q, "==", :a_yes
  
  q_cat111b43 "Frequency of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat113q, "==", :a_yes
  
  q_cat14q "13. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    
  label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_cat14q, "==", :a_yes
  
  q_cat11a3i "i. Antigen:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes

  label "b) Re-immunization (booster)"
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11b43ivb "iv. Volume per site:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat14q, "==", :a_yes
  
  q_cat16q "14. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat16a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat16q, "==", :a_yes
  
  q_cat16b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat16q, "==", :a_yes
  
  q_cat16c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat16q, "==", :a_yes
  
  q_cat17q "15. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat17a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat17q, "==", :a_yes
  
  q_cat17b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat17q, "==", :a_yes
  
  q_cat17c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat17q, "==", :a_yes
  
  q_cat17d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat17q, "==", :a_yes
  
  q_cat17d1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat17q, "==", :a_yes
  
  q_cat17qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"B"       
    condition_B :q_cat17q, "==", :a_yes
  
  q_cat17e1 "if no, Justify:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat17qe, "==", :a_yes
  
  q_cat18q "16. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat18q, "==", :a_yes
  
  q_cat17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat18q, "==", :a_yes
  
  q_cat17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat18q, "==", :a_yes
  
  q_cat19q "17. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat19a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_cat19q, "==", :a_yes
  
  q_cat19b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat19q, "==", :a_yes
  
  q_cat19c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat19q, "==", :a_yes
  
  q_cat20q "18. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat20a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_cat20q, "==", :a_yes
  
  q_cat20b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat20f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat20q, "==", :a_yes
  
  q_cat22q "19.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat22ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_cat22q, "==", :a_yes
  
  q_cat22b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat22q, "==", :a_yes
  
  q_cat22c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat22q, "==", :a_yes
  
  q_cat22d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"B"       
    condition_B :q_cat22q, "==", :a_yes
  
  q_cat121q "20. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_gpur21pr2 "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat121q, "==", :a_yes
  
  q_cat121a "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat121q, "==", :a_yes
  
  q_cat121b1 "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat121q, "==", :a_yes
  
  q_cat121b2 "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat121q, "==", :a_yes
  
  q_cat121d "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat121q, "==", :a_yes
  
  q_cat122q "21. Will recombinant DNA by administered", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat22c2 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat122q, "==", :a_yes
  
  q_cat122c2 "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat122q, "==", :a_yes
  
  q_cat122c3 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat122q, "==", :a_yes
  
  q_cat1224 "Housed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat122q, "==", :a_yes
  
  q_cat1225 "Special handling:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat122q, "==", :a_yes
  
  q_cat123qe "22.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat123a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat123qe, "==", :a_yes
  
  q_cat123b "Biosafety level:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat123qe, "==", :a_yes
  
  q_cat123c "Route of administration:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat123qe, "==", :a_yes
  
  q_cat123d "shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat123qe, "==", :a_yes
  
  q_cat123f "Length of shed:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat123qe, "==", :a_yes
  
  q_cat124q "23. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat124c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat124q, "==", :a_yes
  
  q_cat124c1 "Route of exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat124q, "==", :a_yes
  
  q_cat124c2 "Exposure:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat124q, "==", :a_yes
  
  q_cat124c3 "Excreted:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat124q, "==", :a_yes
  
  q_cat124c4 "Length of excretion:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat124q, "==", :a_yes
                
  q_cat125q "24. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :any
    a_yes "Yes"
  
  q_cat125cae "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_cat125q, "==", :a_yes
  
  q_cat125cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_cat125q, "==", :a_yes
          
  q_cat125cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"A"
    condition_A :q_cat125q, "==", :a_yes
          
  q_cat125cd "d) How often will animals be monitored?"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat125q, "==", :a_yes
          
  q_cat125ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"A"
    condition_A :q_cat125q, "==", :a_yes
         
  q_cat126q "25.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat126c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_cat126q, "==", :a_yes
  
  q_cat126c1 "Route:"
    a :string
    dependency :rule=>"B"       
    condition_B :q_cat126q, "==", :a_yes
  
  q_cat127qee "26. Will a phyical means of euthanasia be used on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
  
  q_cat12e7 "a)What physical method of euthanasia will be used?* Note: animals must be fully anesthetized prior to any physical method of euthanasia."
    a :string
    dependency :rule=>"A"
    condition_A :q_cat127qee, "==", :a_yes
end
end