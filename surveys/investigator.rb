survey "Human Studies Protocol", :default_mandatory => true do
  section "Information Section" do
    
    label "I.   INVESTIGATOR:"
    
    q_1 "Name: "
    a_1 :string 
    q_2 "Home or School Mailing Address: "
    a_2 :string
    q_3 " Telephone Number:"
    a_3 :string
    q_4 " E-Mail Address:"
    a_4 :string
    q_5 "DATE TRAINING COMPLETED "
    a_5 :date
    
    label "[Required training: CITI training; see website for link]"
    q_6 "Investigator Signature "
    a_6 :string
    q_7 "Name of Project Advisor: "
    a_7 :string
    q_8 "E-Mail Address of Project Advisor: "
    a_8 :string
  end

  section "Title of Research Project" do
    q_9 "II.   TITLE OF RESEARCH PROJECT: "
    a_9 :string
  end

  section "Brief Description of Research Methods" do
    q_10 "III.        BRIEF DESCRIPTION OF RESEARCH 
    METHODS (If using a survey/questionnaire, provide a copy). "
    a_10 :text
  end
  
  section "Risks and Inconviences to Subjects" do
    q_11 "IV. RISKS AND INCONVENIENCES TO SUBJECTS (do not answer ‘None’): "
    a_11 :text
  end

section "Subjects" do
label "V.         SUBJECTS:"
q_12 "A.         Expected numbers of subjects:"
a_12 :integer
q_13 "B.        Will research involve minors (age <18 years)? 
                (If 'Yes', please specify and justify.)", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_13a "II.   TITLE OF RESEARCH PROJECT: ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_14 "C.        Will research involve prisoners?", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_15 "Will research involve any specific ethnic, racial, religious, etc.  groups of people?   
                (If 'Yes', please specify and justify.)", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
label "VI.        FOR RESEARCH INVOLVING SURVEYS OR QUESTIONNAIRES: 
        (Be sure to indicate on each instrument, 
        	survey or questionnaire that participation is voluntary.)"
label "Is information being collected about: "
q_17 "Sexual behavior? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_18 "Criminal behavior? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_19 "Alcohol or substance abuse? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_20 "Matters affecting employment? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_21 "Matters relating to civil litigation? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_22 "1. Will the information obtained be completely anonymous, with no 
identifying information linked to the responding subjects? ", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
label "If identifying information will be linked to the responding subjects, how will
 the subjects be identified?  (Please circle or bold your answers)"
q_23 "By name", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_24 "By code", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_25 "By other identifying information", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
q_26 "Does this survey utilize a standardized and/or validated survey tool/questionnaire? 
 (If yes, see IRB website for required wording on surveys and questionnaires.)", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}
end
section "Research Conducted in a Classroom Setting" do
label "VII.        FOR RESEARCH BEING CONDUCTED IN A CLASSROOM SETTING INVOLVING NORMAL EDUCATIONAL PRACTICES: "
label "A. This research project must be approved by your Principal or School Administrator, unless there are circumstances 
      or policies that do not make this possible.  Provide a copy of the principal’s signed approval.  If such approval is 
      not possible, please explain.
      < /br> B. Participation of your students in research must be voluntary and can never affect their rights.  Please make 
      this issue clear on all of your research surveys (use introductory text, see below) and/or interviews (use introductory 
      verbal statement, see below).  The following wording or something similar can be used for the introductory text or 
      statement: Participation in this research is voluntary and participation or non-participation will not affect a student’s grades 
      or class standing in any way.


</ br> C. Extra credit should not be used to encourage participation.  If you absolutely need to use extra credit, then an alternative activity involving the same amount of time and effort must be provided for those who choose not to participate.  This must be clearly described in your IRB application.


</ br> D. Depending on your school policies, consent forms may or may not be required for your research.  Please indicate whether you will be using consent forms or not.  If you are not using consent forms, please justify (e.g., school policy, etc.).  If you do use consent forms, you must include signature lines for parental consent AND student assent.  (Please use accepted format from our website and provide a stand-alone copy.  Do not include form here.)
     




</ br>To qualify as exempt, this research must: 1) involve minimal risk and 2) be conducted in established or commonly accepted educational settings, involving normal educational practices. These include, for example, research on regular and special education instructional strategies or research on the effectiveness of or comparison between instructional techniques, curricula, or classroom management methods.




</ br>PLEASE TYPE YOUR RESPONSES.  Applications can be emailed (cherylj@montana.edu) or mailed to: Institutional Review Board Chair, Mark Quinn, MSU Immunology and Infectious Diseases, 960 Technology Blvd., Room 127, Bozeman, MT 59717. Submit one (1) copy of this application, along with one (1) copy of any surveys, subject consent forms, and all other relevant materials.  For information and assistance, call 994-6783.  
</ br>Please type responses in bold. Do not type in all capitals."

end

end