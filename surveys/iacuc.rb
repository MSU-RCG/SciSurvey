survey "IACUC Protocol", :default_mandatory => false do
	section "Information Section" do
	q_Project_Title "1. Project Title:"
    a_1 :string
    
    q_Project_Type "2. Project Type:"
    a_2bbb :string	

    q_1 "a) If a renewal or revision, please provide previous protocol number:"
    a_3ccc :string

	q_6 "3. Principal Investigator/Faculty Advisor (Note: I am aware that electronic 
		submission of this form constitutes my signature.)"
    a "a) First Name:", :string	
    a "b) Last Name:", :string
    a "c) Department:", :string
    a "d) Title:", :string
    a "e) Phone #:", :string
    a "f) Email address:", :string
    q_application_type "g) Has the P.I. attended ARC training/orientation?", :pick => :any
    a_4a "Yes"    

    q_grant "Extramural grant application (NIH, USDA, etc.)"
    a "i. Provide funding agency name:", :string
    a "ii. Assigned grant number (if available):", :string
    label "iii. Submission date:"
    q "month", :pick => :one, :display_type => :dropdown
    ["January","February", "March", "April","May","June","July","August","September","October","November","December"].each{ |level| a level}
    q "day", :pick => :one, :display_type => :dropdown
    ["1","2", "3", "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"].each{ |level| a level}
    q_Year "Year"
    a_2aa :string	
    q_ngrant1 "iv. In whose name is the grant submitted:"
    a_2bb :string	

    q_intr "b) Intramural funding application (Dept/College):", :pick => :any
    a_4 "Yes" 
    q_comm "Commercial/Industry funding (Private Sector):", :pick => :any
    a_4 "Yes" 
    q_i "i. Provide complete company name:"
    a_2cc :string
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
    a_1 "a) No in vitro options are available."
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

    section "species" do
    q_application_type1 "Select all that apply", :pick => :any
    a_s1 "Mouse"
    a_s2 "Rat"
    a_s3 "Hamster"
    
    group "Mouse" do
    dependency :rule => "M"
    condition_M :q_application_type1, "==", :a_s1   
     
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
    dependency :rule=>"A"
    condition_A :q_mmm, "==", :a_yes
    
    q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :one
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
    dependency :rule=>"A and B"
    condition_A :q_yes1, "count>0"
    condition_B :q_yes1, "!=", :a_no
    q_m1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_yes1, "count>0"
    condition_B :q_yes1, "!=", :a_no
    q_m1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_yes1, "count>0"
    condition_B :q_yes1, "!=", :a_no
    q_m10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_yes1, "count>0"
    condition_B :q_yes1, "!=", :a_no
    q_m1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_m10e, "==", :a_yes
    q_m1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m10e, "count>0"
    condition_B :q_m10e, "!=", :a_no
    q_m1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m10e, "count>0"
    condition_B :q_m10e, "!=", :a_no
    q_mfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_yes1, "count>0"
    condition_B :q_yes1, "!=", :a_no
    q_mfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :mfq, "==", :a_yes
    q_mfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"A and B"
    condition_A :mfq, "count>0"
    condition_B :mfq, "!=", :a_no
    q_mfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"A and B"
    condition_A :mfq, "count>0"
    condition_B :mfq, "!=", :a_no
    q_m11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    label "a) induction"
    dependency :rule=>"A"
    condition_A :q_m11q, "==", :a_yes
    q_m11a "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11a33b1 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    label "b) Maintenance"
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11b "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11b3 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m11q, "count>0"
    condition_B :q_m11q, "!=", :a_no
    q_m12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a) induction"
    dependency :rule=>"A"
    condition_A :q_m12q, "==", :a_yes
    q_m11a2 "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m11a32 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m12q, "count>0"
    condition_B :q_m12q, "!=", :a_no
    q_m13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_m13q, "==", :a_yes
    q_m11a3 "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m13q, "count>0"
    condition_B :q_m13q, "!=", :a_no
    q_m11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m13q, "count>0"
    condition_B :q_m13q, "!=", :a_no
    q_m11a33 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m13q, "count>0"
    condition_B :q_m13q, "!=", :a_no
    q_m11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m13q, "count>0"
    condition_B :q_m13q, "!=", :a_no
    q_m14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_m14q, "==", :a_yes
    q_m11a3i "i. Antigen:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    label "b) Re-immunization (booster)"
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11b43ivb "iv. Volume per site:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m14q, "count>0"
    condition_B :q_m14q, "!=", :a_no
    q_m15q "15.  Will monoclonal antibodies be generated utilized the ascites production method?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m15a "a) Justify why this method is required and why alteratives are not available:"
    a :text
    dependency :rule=>"A"
    condition_A :q_m15q, "==", :a_yes
    q_m15b "b) Describe methods that will be used to decrease pain and distress:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m15q, "count>0"
    condition_B :q_m15q, "!=", :a_no
    q_m16q "16. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m16a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m16q, "==", :a_yes
    q_m16b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m16q, "count>0"
    condition_B :q_m16q, "!=", :a_no
    q_m16c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m16q, "count>0"
    condition_B :q_m16q, "!=", :a_no
    q_m17q "17. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m17a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m17q, "==", :a_yes
    q_m17b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m17q, "count>0"
    condition_B :q_m17q, "!=", :a_no
    q_m17c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m17q, "count>0"
    condition_B :q_m17q, "!=", :a_no
    q_m17d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m17q, "count>0"
    condition_B :q_m17q, "!=", :a_no
    q_m17d1 "if no, Justify:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m17q, "count>0"
    condition_B :q_m17q, "!=", :a_no
    q_m17qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_m17q, "count>0"
    condition_B :q_m17q, "!=", :a_no
    q_m17e1 "if no, Justify:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m17qe, "count>0"
    condition_B :q_m17qe, "!=", :a_no
    q_m18q "18. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_m18q, "==", :a_yes
    q_m17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m18q, "count>0"
    condition_B :q_m18q, "!=", :a_no
    q_m17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m18q, "count>0"
    condition_B :q_m18q, "!=", :a_no
    q_m19q "19. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m19a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_m19q, "==", :a_yes
    q_m19b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m19q, "count>0"
    condition_B :q_m19q, "!=", :a_no
    q_m19c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m19q, "count>0"
    condition_B :q_m19q, "!=", :a_no
    q_m20q "20. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m20a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_m20q, "==", :a_yes
    q_m20b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m20f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m20q, "count>0"
    condition_B :q_m20q, "!=", :a_no
    q_m21q "21. Will animals be irradiated?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m21i "a) Room location"
    a :string
    dependency :rule=>"A"
    condition_A :q_m21q, "==", :a_yes
    q_m21ii "b)Number of animals to be irradiated:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m21q, "count>0"
    condition_B :q_m21q, "!=", :a_no
    q_m21c "c)Who will operate the irradiation equipment?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m21q, "count>0"
    condition_B :q_m21q, "!=", :a_no
    q_m22q "22.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m22ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_m22q, "==", :a_yes
    q_m22b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m22q, "count>0"
    condition_B :q_m22q, "!=", :a_no
    q_m22c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m22q, "count>0"
    condition_B :q_m22q, "!=", :a_no
    q_m22d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m22q, "count>0"
    condition_B :q_m22q, "!=", :a_no
    q_m23q "23. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m23c "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m23q, "==", :a_yes
    q_m23a "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m23q, "count>0"
    condition_B :q_m23q, "!=", :a_no
    q_m23b1 "Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m23q, "count>0"
    condition_B :q_m23q, "!=", :a_no
    q_m23b2 "shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m23q, "count>0"
    condition_B :q_m23q, "!=", :a_no
    q_m23d "Length of shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m23q, "count>0"
    condition_B :q_m23q, "!=", :a_no
    q_m24q "24.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m24c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_m24q, "==", :a_yes
    q_m24c2 "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m24q, "count>0"
    condition_B :q_m24q, "!=", :a_no
    q_m24c3 "Route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m24q, "count>0"
    condition_B :q_m24q, "!=", :a_no
    q_m244 "Housed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m24q, "count>0"
    condition_B :q_m24q, "!=", :a_no
    q_m245 "Special handling:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m24q, "count>0"
    condition_B :q_m24q, "!=", :a_no
    q_m25q "25.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m25a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m25q, "==", :a_yes
    q_m25b "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m25q, "count>0"
    condition_B :q_m25q, "!=", :a_no
    q_m25c "Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m25q, "count>0"
    condition_B :q_m25q, "!=", :a_no
    q_m25d "shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m25q, "count>0"
    condition_B :q_m25q, "!=", :a_no
    q_m25f "Length of shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m25q, "count>0"
    condition_B :q_m25q, "!=", :a_no
    q_m26q "26. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m26c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m26q, "==", :a_yes
    q_m26c1 "Route of exposure:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m26q, "count>0"
    condition_B :q_m26q, "!=", :a_no
    q_m26c2 "Exposure:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m26q, "count>0"
    condition_B :q_m26q, "!=", :a_no
    q_m26c3 "Excreted:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m26q, "count>0"
    condition_B :q_m26q, "!=", :a_no
    q_m26c4 "Length of excretion:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m26q, "count>0"
    condition_B :q_m26q, "!=", :a_no
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
    dependency :rule=>"A and B"
    condition_A :q_m27q, "count>0"
    condition_B :q_m27q, "!=", :a_no
    q_m28q "28. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m28ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_m28q, "==", :a_yes
    q_m28cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m28q, "count>0"
    condition_B :q_m28q, "!=", :a_no
    q_m28cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_m28q, "count>0"
    condition_B :q_m28q, "!=", :a_no
    q_m28cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m28q, "count>0"
    condition_B :q_m28q, "!=", :a_no
    q_m28ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m28q, "count>0"
    condition_B :q_m28q, "!=", :a_no
    q_m29q "29.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_m29c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_m29q, "==", :a_yes
    q_m29c1 "Route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m29q, "count>0"
    condition_B :q_m29q, "!=", :a_no
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
    dependency :rule=>"A and B"
    condition_A :q_m30q, "count>0"
    condition_B :q_m30q, "!=", :a_no
    q_m30i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_m30qb, "==", :a_yes
    q_m30ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m30qb, "count>0"
    condition_B :q_m30qb, "!=", :a_no
    q_m30iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_m30qb, "count>0"
    condition_B :q_m30qb, "!=", :a_no
    


    end
     group "Rat" do  
    dependency :rule => "R"
    condition_R :q_application_type1, "==", :a_s2 
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
    dependency :rule=>"A"
    condition_A :q_rrr, "==", :a_yes
    
    q "5. Justify the number of animals required for the 3 year duration of the IACUC protocol (Check and complete all that apply)", :pick => :one
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
  
    q_yes12 "10.  Will a surgical procedure, either survival or terminal, or tissue harvest prior to death be performed on the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q "a) Describe the required pre-operative procedures (fasting, etc):"
    a :text
    dependency :rule=>"A"
    condition_A :q_yes12, "==", :a_yes
    q "b)Describe the surgical or tissue harvest procedures performed on living animals in detail, including name of procedure, anatomic approach, tissue manipulation, and closure techniques:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_yes12, "count>0"
    condition_B :q_yes12, "!=", :a_no
    q_r1c "c)Who will perform the surgical procedure or tissue harvest?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_yes12, "count>0"
    condition_B :q_yes12, "!=", :a_no
    q_r1d "d) Building and room # where procedures will be performed?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_yes12, "count>0"
    condition_B :q_yes12, "!=", :a_no
    q_r10e "e) Will animals be allowed to recover from the anesthetic?", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_yes12, "count>0"
    condition_B :q_yes12, "!=", :a_no
    q_r1i "i) What procedures will be done to minimize the incidence of sepsis?"
    a :string
    dependency :rule=>"A"
    condition_A :q_r10e, "==", :a_yes
    q_r1ii "ii)Describe the post-operative procedures/monitoring of the animals:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r10e, "count>0"
    condition_B :q_r10e, "!=", :a_no
    q_r1iii "iii)Who is responsible for the post-operative care of the animals?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r10e, "count>0"
    condition_B :q_r10e, "!=", :a_no
    q_rfq "f) Will a single animal experience more than one major survival surgical procedure (penetrates and exposes a body cavity or produces substantial impairment of physiologic function:  and the animal recovers from anesthesia)?  If Yes, answere all sub-questions.", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_yes12, "count>0"
    condition_B :q_yes12, "!=", :a_no
    q_rfi "i) How many surgeries will the animal experience?"
    a :string
    dependency :rule=>"A"
    condition_A :rfq, "==", :a_yes
    q_rfii "ii)What will be the time period between surgeries?"
    a :string
    dependency :rule=>"A and B"
    condition_A :rfq, "count>0"
    condition_B :rfq, "!=", :a_no
    q_rfiii "iii) Provide a scientific rationale for the necessity of multiple major survival surgical procedures on the same animal."
    a :string
    dependency :rule=>"A and B"
    condition_A :rfq, "count>0"
    condition_B :rfq, "!=", :a_no
    q_r11q "11.  Will the animals be anesthetized?", :pick => :one
    a_yes "Yes"
    a_no  "No"
    label "a) induction"
    dependency :rule=>"A"
    condition_A :q_r11q, "==", :a_yes
    q_r11a "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11a22a "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11a33b1 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    label "b) Maintenance"
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11b "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11b2 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11b3 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r11b4 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r1cc "c) Describe the method for monitoring anesthetic depth (parameters, frequency):"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r1dd "d) Who will be responsible for monitoring anesthesia?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r11q, "count>0"
    condition_B :q_r11q, "!=", :a_no
    q_r12q "12.  Will muscle relaxants (paralytics, neuromuscular blocking agents) be utilized?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a) induction"
    dependency :rule=>"A"
    condition_A :q_r12q, "==", :a_yes
    q_r11a2 "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r11a22 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r11a32 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r11b42 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r12b "b) How ill it be determined thtat the paralyzed animal is adequately anesthetized?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r12c "c) Provide the justification for the use of a muscle relaxant."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r12q, "count>0"
    condition_B :q_r12q, "!=", :a_no
    q_r13q "13. Will anlgesics (pain relievers) be used?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a)List behavioral and.or clinical signs that will be utilized to evaluate pain."
    dependency :rule=>"A"
    condition_A :q_r13q, "==", :a_yes
    q_r11a3 "agent"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r13q, "count>0"
    condition_B :q_r13q, "!=", :a_no
    q_r11a23 "does (mg/kg):"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r13q, "count>0"
    condition_B :q_r13q, "!=", :a_no
    q_r11a33 "route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r13q, "count>0"
    condition_B :q_r13q, "!=", :a_no
    q_r11b43 "Frequency of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r13q, "count>0"
    condition_B :q_r13q, "!=", :a_no
    q_r14q "14. Will animals be immunized?", :pick => :one
    a_yes "Yes"
    a_no "No"
    label "a) Initial Immunization"
    dependency :rule=>"A"
    condition_A :q_r14q, "==", :a_yes
    q_r11a3i "i. Antigen:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11a23ii "ii. Adjuvant: (If you are using complete freunds's adjuvant - Recogizing sensitivity of the use of complete Freund's you will need to adequately justify its use.  Following IACUC Policy, animals will be  immunized by the ARC staff and any exceptions must be approved by the IACUC and the attending Veterinarian"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11a33iii "iii. Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11b43iv "iv. Anatomical site of injection:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11b43va "v. Volume per site:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11b43vi "vi. Number of sites to be injected:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    label "b) Re-immunization (booster)"
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11a3ib "i. Adjuvant:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11a23iib "ii. Frequency of re-immunizations:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11a33iiib "iii. Anatomical site of injection:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11b43ivb "iv. Volure per site:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    q_r11b43vab "v. Number of sites to be injected:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r14q, "count>0"
    condition_B :q_r14q, "!=", :a_no
    
    q_r15q "15. Will blood be collected from the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r15a "a) Describe the blood collection method(s). *Note that anesthesia is required for a terminal bleed and/or cardiac puncture:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r15q, "==", :a_yes
    q_r15b "b) Maximum volume of blood to be obtained at each collection:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r15q, "count>0"
    condition_B :q_r15q, "!=", :a_no
    q_r15c "c) Frequency of blood collection:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r15q, "count>0"
    condition_B :q_r15q, "!=", :a_no
    q_r16q "16. Will tumors be implanted or induced in the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r16a "a) Identify the tumor line and/or tumor type:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r16q, "==", :a_yes
    q_r16b "b) What is the anatomical site of tumor implantation or indcution in the animals?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r16q, "count>0"
    condition_B :q_r16q, "!=", :a_no
    q_r16c "c) Will the tumor be permitted to grow to greater than 10% of the animal's body weight or become ulcerated?  If yes, justify the reason:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r16q, "count>0"
    condition_B :q_r16q, "!=", :a_no
    q_r16d "d) Will the tumor-bearing animals be observed daily for adverse effects?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r16q, "count>0"
    condition_B :q_r16q, "!=", :a_no
    q_r16d1 "if no, Justify:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r16q, "count>0"
    condition_B :q_r16q, "!=", :a_no
    q_r16qe "e)Is the tumor of rodent origin or has the tumor been passaged in rodents? (if yes, MAP or PCR testing must be performed.)", :pick => :one
    a_yes "Yes"
    a_no "No"
    dependency :rule=>"A and B"
    condition_A :q_r16q, "count>0"
    condition_B :q_r16q, "!=", :a_no
    q_r16e1 "if no, Justify:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r16qe, "count>0"
    condition_B :q_r16qe, "!=", :a_no
    q_r17q "17. Will conscious animals be restrained for periods longer than two hours?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r17cc "a)Provide the maximum length of time conscious animals will be restrained?"
    a :string
    dependency :rule=>"A"
    condition_A :q_r17q, "==", :a_yes
    q_r17dd "b) What type of restraint device will be used?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r17q, "count>0"
    condition_B :q_r17q, "!=", :a_no
    q_r17d11 "c) How will the animals be trained or acclimated to the restraint device (note the approximate number of sessions and duration of each)?"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r17q, "count>0"
    condition_B :q_r18q, "!=", :a_no
    q_r18q "18. Will conscious animals be subjected to aversive stimuli to elicit a response?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r18a "a) Explain why this is required and why alternative non-aversive stimuli cannot be used."
    a :text
    dependency :rule=>"A"
    condition_A :q_r18q, "==", :a_yes
    q_r18b "b) Descibe the adverse stimullus, including frequrency and duration."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r18q, "count>0"
    condition_B :q_r18q, "!=", :a_no
    q_r18c "c)Describe the limits of the stimulus if the desired respone does not occur."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r18q, "count>0"
    condition_B :q_r18q, "!=", :a_no
    q_r19q "19. Is water or food restriction required for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r19a "a) Provide scientific justification for the restriction, including why alternatives cannot be used:"
    a :text
    dependency :rule=>"A"
    condition_A :q_r19q, "==", :a_yes
    q_r19b "b)Describe the restriction protocol, including frequrency, duration, and scheduling of 'vacation' periods:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19i "i. Provid the maximum restriction levels:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19ii "ii. What is the minimum duration of time daily that an animal has access to food or fluids?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19c "c) What baseline data that will be collected prior to restriction?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19d "d) Describe the initial acclimation to restriction:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19e "e) Describe the health monitoring program for restricted animals (parameters measured, frequency):"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r19q, "!=", :a_no
    q_r19f "f) Describe criteria used for temporary of permanent removal of animals from the restriction protocol:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r19q, "count>0"
    condition_B :q_r20q, "!=", :a_no
    
    q_r20q "20.  Will radioisotopes be administered to the animals in the study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r20ac "a) list the personnel who will handle the radioisotopes:"
    a :text
    dependency :rule=>"A"
    condition_A :q_r20q, "==", :a_yes
    q_r20b "b)List all rooms where radioisotopes will be used:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r20q, "count>0"
    condition_B :q_r20q, "!=", :a_no
    q_r20c1 "c) Number of animals to which radioisotopes will be administered:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r20q, "count>0"
    condition_B :q_r20q, "!=", :a_no
    q_r20d "d) Radioisotope that will be used:"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r20q, "count>0"
    condition_B :q_r20q, "!=", :a_no
    q_r21q "21. Will organisms that are potentially infectious to humans (classified by CDC at some biosafety level) be administered to the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r21c "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r21q, "==", :a_yes
    q_r21a "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r21q, "count>0"
    condition_B :q_r21q, "!=", :a_no
    q_r21b1 "Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r21q, "count>0"
    condition_B :q_r21q, "!=", :a_no
    q_r21b2 "shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r21q, "count>0"
    condition_B :q_r21q, "!=", :a_no
    q_r21d "Length of shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r21q, "count>0"
    condition_B :q_r21q, "!=", :a_no
    q_r22q "22.  Will recombinant DNA be administed and/or a new transgenetic mouse be produced?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r22c1 "Name::"
    a :string
    dependency :rule=>"A"
    condition_A :q_r22q, "==", :a_yes
    q_r22c2 "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r22q, "count>0"
    condition_B :q_r22q, "!=", :a_no
    q_r22c3 "Route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r22q, "count>0"
    condition_B :q_r22q, "!=", :a_no
    q_r224 "Housed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r22q, "count>0"
    condition_B :q_r22q, "!=", :a_no
    q_r225 "Special handling:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r22q, "count>0"
    condition_B :q_r22q, "!=", :a_no
    q_r23q "23.  Will organisms that are infectious to other animals be administered to the animals in this protocol?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r23a "Name of organism:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r23q, "==", :a_yes
    q_r23b "Biosafety level:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r23q, "count>0"
    condition_B :q_r23q, "!=", :a_no
    q_r23c "Route of administration:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r23q, "count>0"
    condition_B :q_r23q, "!=", :a_no
    q_r23d "shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r23q, "count>0"
    condition_B :q_r23q, "!=", :a_no
    q_r23f "Length of shed:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r23q, "count>0"
    condition_B :q_r23q, "!=", :a_no
    q_r24q "24. Will a toxic substance, carcinogen, or mutagen be administered to the animal?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r24c "Name:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r24q, "==", :a_yes
    q_r24c1 "Route of exposure:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r24q, "count>0"
    condition_B :q_r24q, "!=", :a_no
    q_r24c2 "Exposure:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r24q, "count>0"
    condition_B :q_r24q, "!=", :a_no
    q_r24c3 "Excreted:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r24q, "count>0"
    condition_B :q_r24q, "!=", :a_no
    q_r24c4 "Length of excretion:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r24q, "count>0"
    condition_B :q_r24q, "!=", :a_no
    
    q_r25q "25. Is Natural (no intervention) death required as an endpoint for this study?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r25ca "a) Justify why alternative endpoints (hypotermia, weight loss, lethargy, etc.) are not acceptable for this study."
    a :text
    dependency :rule=>"A"
    condition_A :q_r25q, "==", :a_yes
    q_r25cb "b)Describe the expected clinical signs and time to death for this study."
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r25q, "count>0"
    condition_B :q_r25q, "!=", :a_no
    q_r25cc "c)List personnel responsible for animal observations"
    a :text
    dependency :rule=>"A and B"
    condition_A :q_r25q, "count>0"
    condition_B :q_r25q, "!=", :a_no
    q_r25cd "d) How oftern will animals be monitored?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r25q, "count>0"
    condition_B :q_r25q, "!=", :a_no
    q_r25ce "e) In order to minimize pain or distress, are there any circumstances in which intervention (anesthetics, analgesics, supportive therapy) is permissible? If yes, please describe."
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r25q, "count>0"
    condition_B :q_r25q, "!=", :a_no
    q_r26q "26.  Euthanasia: Will an overdose of a chemical (CO2, pentobarbital, etc) be used as the means of euthanasia for the animals?", :pick => :one
    a_yes "Yes"
    a_no "No"
    q_r26c "Agent:"
    a :string
    dependency :rule=>"A"
    condition_A :q_r26q, "==", :a_yes
    q_r26c1 "Route:"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r26q, "count>0"
    condition_B :q_r26q, "!=", :a_no
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
    dependency :rule=>"A and B"
    condition_A :q_r27q, "count>0"
    condition_B :q_r27q, "!=", :a_no
    q_r27i "i.Provide rationale for the use of phyical methods of euthanasia w/out anesthesia"
    a :text
    dependency :rule=>"A"
    condition_A :q_r27qb, "==", :a_yes
    q_r27ii "ii. Who will perform the phyical method of euthanasia?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r27qb, "count>0"
    condition_B :q_r27qb, "!=", :a_no
    q_r27iii "iii. What training have been provided?"
    a :string
    dependency :rule=>"A and B"
    condition_A :q_r27qb, "count>0"
    condition_B :q_r27qb, "!=", :a_no
    end
   group "Hamster" do
    dependency :rule => "H"
    condition_H :q_application_type1, "==", :a_s3  
    q_H1 "1.Strain"
    a :string
     q_H2 "2.Age or Weight"
    a :string
    q_H3 "3.Rationale for using this species"
    a :string
    end
        end

end