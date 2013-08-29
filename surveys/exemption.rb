survey "Request for Designation of Research as Exempt", :default_mandatory => true do
  section "Instructions" do
    label "<h3>MSSE Research Projects Only</h3>"
    label "<p>To qualify as exempt, this research  must: 1) involve minimal risk and 2) be conducted in established or commonly accepted educational settings, involving normal educational practices. These include, for example, research on regular and special education instructional strategies or research on the effectiveness of or comparison between instructional techniques, curricula, or classroom management methods.</p>"
    label "<p>Submit one (1) copy of this application, along with one (1) copy of any surveys, subject consent forms, and all other relevant materials.  For information and assistance, call 994-6783.</p>"
    
    label "<pre>THIS AREA IS FOR INSTITUTIONAL REVIEW BOARD USE ONLY. DO NOT WRITE IN THIS AREA.<br/>Confirmation Date:<br/>Application Number:</pre>"
    label "Address each section – do not leave any section blank. "
  end
  section "Section I " do
    label "<h3>INVESTIGATOR</h3>"
    q_1 "Investigator"
      a_1 "Name:", :string
      a_2 "Home or School Mailing Address:", :string
      a_3 "Telephone Number:", :string
      a_4 "E-Mail Address:", :string
      a_5 "DATE TRAINING COMPLETED [Required training: CITI training; see website for link]:", :date 
      a_6 "Investigator Signature", :string
      
    q_2 "Name of Project Advisor:"
      a_1 :string
      
    q_3 "E-Mail Address of Project Advisor:"
      a_1 :string 
  end
  section "Section II" do
    label "<h3>TITLE OF RESEARCH PROJECT</h3>"
    q_4 "Title of Research Project:"
      a_1 :string
  end
  section "Section III" do
    label "<h3>BRIEF DESCRIPTION OF RESEARCH METHODS</h3>"
    q_5 "Brief description of research methods (If using a survey/questionnaire, provide a copy):"
      a_1 :text
  end
  section "Section IV" do
    label "<h3>RISKS AND INCONVENIENCES TO SUBJECTS</h3>"
    q_6 "Risks and inconviences to subjects (do not answer ‘None’):"
      a_1 :text
  end
  section "Section V" do
    label "<h3>SUBJECTS</h3>"
    q_7 "Expected numbers of subjects:"
      a_1 :integer
    
    q_8 "Will research involve minors (age <18 years)?",:pick => :one
      a_1 "Yes"
      a_2 "No"

    q_8a "Please specify and justify."
      dependency :rule => "A"
      condition_A :q_8, "==", :a_1
      a_1 :text

    q_9 "Will research involve prisoners?", :pick => :one
      a_1 "Yes"
      a_2 "No"

    q_10 "Will research involve any specific ethnic, racial, religious, etc.  groups of people? ",:pick => :one  
      a_1 "Yes"
      a_2 "No"

    q_10a "Please specify and justify."
      dependency :rule => "B"
      condition_B :q_10, "==", :a_1
      a_1 :text
    
  end
  section "Section V" do
    label "<h3>FOR RESEARCH INVOLVING SURVEYS OR QUESTIONNAIRES</h3>"
    label "(Be sure to indicate on each instrument, survey or questionnaire that participation is voluntary.)"

    group "Is information being collected about:" do

      q_11 "Sexual behavior?",:pick=>:one
        a_1 "Yes"
        a_2 "No"

      q_12 "Criminal behavior?",:pick=>:one
        a_1 "Yes"
        a_2 "No"
          
      q_13 "Alcohol or substance abuse?",:pick=>:one
        a_1 "Yes"
        a_2 "No"

      q_14 "Matters affecting employment?",:pick=>:one
        a_1 "Yes"
        a_2 "No"
        
      q_15 "Matters relating to civil litigation?",:pick=>:one
        a_1 "Yes"
        a_2 "No"
   end
      q_16 "Will the information obtained be completely anonymous, with no identifying information linked to the responding subjects?",:pick=>:one
       a_1 "Yes"
       a_2 "No"

      q_17 "If identifying information will be linked to the responding subjects, how will the subjects be identified?", :pick => :any
        a_1 "By name"
        a_2 "By code"
        a_3 "By other identifying information"

      q_18 "Does this survey utilize a standardized and/or validated survey tool/questionnaire? (If yes, see IRB website for required wording on surveys and questionnaires.)", :pick => :one  
        a_1 "Yes"
        a_2 "No"
  
  end
    section "Section VII" do
    label "<h3>FOR RESEARCH BEING CONDUCTED IN A CLASSROOM SETTING INVOLVING NORMAL EDUCATIONAL PRACTICES:</h3>"

    q_19 "This research project must be approved by your Principal or School Administrator, unless there are circumstances or policies that do not make this possible.   Provide a copy of the principal’s signed approval.  If such approval is not possible, please explain."
      a_1 :text

    label "Participation of your students in research must be voluntary and can never affect their rights.   Please make this issue clear on all of your research surveys (use introductory text, see below) and/or interviews (use introductory verbal statement, see below).  The following wording or something similar can be used for the introductory text or statement: Participation in this research is voluntary and participation or non-participation will not affect a student’s grades or class standing in any way."

    label "Extra credit should not be used to encourage participation.  If you absolutely need to use extra credit, then an alternative activity involving the same amount of time and effort must be provided for those who choose not to participate.  This must be clearly described in your IRB application."
    
    q_20 "Depending on your school policies, consent forms may or may not be required for your research.  Please indicate whether you will be using consent forms or not.  If you are not using consent forms, please justify (e.g., school policy, etc.).  If you do use consent forms, you must include signature lines for parental consent AND student assent.  (Please use accepted format from our website and provide a stand-alone copy.  Do not include form here.)"
      a_1 :text
  end
end