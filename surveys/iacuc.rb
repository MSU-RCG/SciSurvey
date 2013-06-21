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

end