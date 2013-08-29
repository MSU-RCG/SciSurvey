survey "Institutional Review Board Application for Review", :default_mandatory => true do
  section "Section I" do
    label "Beginning January 1, 2006, University policy requires that all protocols submitted from individuals NOT employeed by or students of Montana State University be charged a $500 review fee per application. Renewals for those proposals will be at no charge. Applications from private entities (i.e. projects not administered by MSU's Office of Sponsored Programs) will be charged the $500 fee per application. Renewals for those proposals will also be at no charge.
    All investigators must complete the online training in the use of human subjects. Most investigators will need to choose the Behavioral Sciences Module. Use this link: <a href ='https://www.citiprogram.org/'>Collaborative Institutional Training Initiative (CITI)</a>"
    
    repeater "Investigators and Associates (list all investigators involved; application will be filed under name of first
        person listed)" do
      q_1 "Person"
      a_1 "Name:",:string 
      a_2 "Title ", :string
      a_3 " Dept:", :string
      a_4 "Phone:", :string
      a_5 "Address:", :string
      a_6 "E-mail Address:", :string
      a_7 "Date Training Completed - Required training: CITI training (see IRB website for link) ", :date
    end

    q_8 "Do you as PI, any family member or any of the involved researchers or their family members have consulting agreements, management responsibilities or substantial equity (greater than $10,000 in value or greater than 5% total equity) in the sponsor, subcontractor or in the technology, or serve on the Board of the Sponsor? If you answered Yes, you will need to contact Pamela Merrell, Assistant Legal Counsel-JD at 406-994-3480.", :pick => :one
      a_1 "Yes"
      a_2 "No"
      
      
  end
  section "Section II" do
    q_9 "Title of Proposal (please be sure this appears on the first page):"
      a_1 :text
  end
  section "Section III" do
    q_10 "Beginning Date for Use of Human Subjects:"
      a_1 :date
  end
  
  section "Section IV" do
    label "Type of Grant and/or Project (if applicable):"
    
    q_11 "Research Grant:"
      a_1 :string
    
    q_12 "Contract:"
      a_1 :string
    
    q_13 "Training Grant:"
      a_1 :string
    
    q_14 "Classroom Experiements/Projects:"
      a_1 :string
    
    q_15 "Thesis Project:"
      a_1 :string
    
    q_16 "Other:"
      a_1 :string
  end
  
  section "Section V" do
    q_17 "Name of Funding Agency to which Proposal is Being Submitted (if applicable):"
      a_1 :string
  end
  
  section "Section VI" do
    label "Signatures"
    
    label "Submitted by Investigator"
    q_18 "Typed Name:"
     a_1 :string
     
    label "Signature:"
    label "Date:"
    
    label "Faculty sponsor (for student)"
    
    q_19 "Typed Name:"
     a_1 :string
     
    label "Signature:<br/>Date:"

  end
  
  section "Section VII" do
    label "Summary of Activity. Provide answers to each section and add space as needed. Do not refer to an accompanying grant or contract proposal."
    
    q_20 "RATIONALE AND PURPOSE OF RESEARCH (What question is being asked?)"
      a_1 :text

    q_21 "RESEARCH PROCEDURES INVOLVED. Provide a short description of sequence and methodd of procudes that will be performed with human subject.  Include details of painful or uncomfortable procedures, frequency of procedures, time involved, names of psychological tests, questionaires, restrictions on usual life patterns, and follow up procedures."
      a_1 :text
    
    q_22 "DECEPTION- If any deception (withholding of complete information) is required for the validity of this activity, explain why this is necessary and attach debriefing statement."
      a_1 :text
    
    group "SUBJECTS"do
    
      q_23 "Approximate number and ages"
          a_1 "How Many Subjects", :integer
          a_2 "Age Range of Subjects", :string
          a_3 "How Many Normal/Control", :integer
          a_4 "Age Range of Normal/Control", :integer
      
      q_24 "Criteria for selection"
        a_1 :text
      
      q_25 "Criteria for exclusion"
        a_1 :text
      
      q_26 "Source of Subjects (including patients):"
        a_1 :text
      
      q_27 "Who will approach subject and how?  Explain steps taken to avoid coercion."
        a_1 :text
      
      q_28 "Will subjects receive paymoents, service without charge, or extra course credit?  (Yes or No. If yes, what amount and how?  Are there other ways to receive simiilar benefits?)"
        a_1 :text
      
      q_29 "Location(s) where procedures will be carried out?"
        a_1 :text 
    end
    
    group "RISKS AND BENEFITS (ADVERSE EFFECTS)" do
      q_30 "Describe nature and amount of risk and/or adverse effects (including side effects), substantial stress, discomfort, or invasion of privacy involved."
        a_1 :text
      
      q_31 "Will this study preclude standard procedures (e.g., medical or psychological care, school attendance, etc.)? If yes, explain."
        a_1 :text
      
      q_32 "Describe the expected benefits for individual subjects and/or society."
        a_1 :text
    end
    
    group "ADVERSE EFFECTS" do
      q_33 "How will possible adverse effects be handled?"
        a_1 "By investigator(s):", :text
        a_2 "Referred by investigator(s) to appropriate care:", :text
        a_3 "Other (explain):", :text
        
      q_34 "Are facilities/equipment adequate to handle possible adverse effects? (Yes or No. If no, explain.)"
        a_1 :text
      
      q_35 "Describe arrangements for financial responsibility for any possible adverse effects."
        a_1 "MSU compensation (explain):", :text
        a_2 "Sponsoring agency insurance:", :text
        a_3 "Subject is responsible:", :text
        a_4 "Other (explain):", :text
    end
    group "CONFIDENTIALITY OF RESEARCH DATA" do
      q_36 "Will data be coded?", :pick => :one
        a_1 "Yes"
        a_2 "No"
      
      q_37  "Will master code be kept separate from data?", :pick => :one
        a_1 "Yes"
        a_2 "No"
        
      q_38 "Will any other agency have access to identifiable data? (Yes or No. If yes, explain.)"
        a_1 :text
        
      q_39 "How will documents, data be stored and protected?"
          a_1 "Locked file:", :string
          a_2 "Computer with restricted password:", :string
          a_3 "Other (explain):", :text
    end

  end
  section "Section VIII" do
    label "Checklist to be Completed by Investigator(s)"
    
    q_40 "Will any group, agency, or organization be involved? (Yes or No. If yes, please confirm"
      a_1 :text
      
    q_41 "Will materials with potential radiation risk be used (e.g. x-rays, radioisotopes)?", :pick => :one
      a_1 "Yes"
      a_2 "No"
    
    q_42 "Status of annual review by MSU Radiation Sources Committee (RSC). (Pending or Approved. If approved, attach one copy of approval notice.)", :pick => :one
      dependency :rule => "A"
      condition_A :q_41, "==", :a_1
      a_1 "Pending"
      a_2 "Approved"
    
    q_43 "Title of application submitted to MSU RSC (if different)."
      dependency :rule => "A"
      condition_A :q_41, "==", :a_1
      a_1 :text
    
    q_44 "Will human blood be utilized in your proposal?", :pick => :one
      a_1 "Yes"
      a_2 "No"
      
      group "Please answer the following questions:" do
        dependency :rule => "X"
        condition_X :q_44, "==", :a_1
        q_45 "Will blood be drawn?", :pick => :one
          a_1 "Yes"
          a_2 "No"
        
        q_47a "Who will draw the blood and how is the individual qualified to draw blood? What procedure will be utilized?)"
          dependency :rule => "B"
          condition_B :q_45, "==", :a_1
          a_1 :text
        
        q_46 "Will the blood be tested for HIV?", :pick => :one
          a_1 "Yes"
          a_2 "No"
      
        q_47 "What disposition will be made of unused blood?"
          a_1 :text

        q_48 "Has the MSU Occupational Health Officer been contacted?", :pick => :one
          a_1 "Yes"
          a_2 "No"
      end
      q_49 "Will non-investigational drugs or other substances be used for purposes of the research?",  :pick => :one
        a_1 "Yes"
        a_2 "No"
      
      # group "A" do
      #   d
      #   label "something"
        repeater "Substance List:" do
          dependency :rule => "Q"
          condition_Q :q_49, "==", :a_1
          q_49A "Substance:"
          a_1 "Name:", :string
          a_2 "Dose:", :string
          a_3 "Source:", :string
          a_4 "How Administered:", :text
          a_5 "Side effects:", :text
        end
      # end
      q_50 "Will any investigational new drug or other investigational substance be used? (Yes or No. If yes, provide information requested below and one copy of: 1) available toxicity data; 2) reports of animal studies; 3) description of studies done in humans; 4) concise review of the literature prepared by the investigator(s); and 5) the drug protocol.)", :pick => :one
        a_1 "Yes"
        a_2 "No"
      
      #   group "" do
      #     dependency :rule => "C2"
      #     condition_C2 :q_50, "==", :a_1
        repeater "Substance List:" do
          dependency :rule => "W"
          condition_W :q_50, "==", :a_1
          q_50a "Substance:"
          a_1 "Name:", :string
          a_2 "Dose:", :string
          a_3 "Source:", :string
          a_4 "How Administered:", :text
          a_5 "Side effects:", :text
        end
      # end
    q_51 "Will an investigational device be used? (Yes or No. If yes, provide name, source description of purpose, how used, and status with the U.S. Food and Drug Administration FDA). Include a statement as to whether or not device poses a significant risk. Attach any relevant material.)", :pick => :one
      a_1 "Yes"
      a_2 "No"
      
    q_51a "Provide name, source description of purpose, how used, and status with the U.S. Food and Drug Administration FDA). Include a statement as to whether or not device poses a significant risk. Attach any relevant material.)"
      dependency :rule => "D"
      condition_D :q_51, "==", :a_1
      a_1 :text
      
    q_52 "Will academic records be used?", :pick => :one
      a_1 "Yes"
      a_2 "No"
      
    group "Will this research involve the use of:" do
      q_53  "Medical, psychiatric and/or psychological records?", :pick => :one
        a_1 "Yes"
        a_2 "No"
        
      q_54 "Health insurance records?", :pick => :one
        a_1 "Yes"
        a_2 "No"
      
      q_55 "Any other records containing information regarding personal health and illness?", :pick => :one
        a_1 "Yes"
        a_2 "No"
    
     label "If you answered YES to any of three items above, you must complete the <a href='http://www2.montana.edu/irb/HIPAAworksheet.htm'>HIPAA worksheet.</a>"    
    end
    
    q_56 "Will audio-visual or tape recordings or photographs be made?", :pick => :one
      a_1 "Yes"
      a_2 "No"
    
    q_57 "Will written consent form(s) be used? (Please use accepted format from our website. Be sure to indicate that participation is voluntary. Provide a stand-alone copy; do not include the form here.) (Yes or No. If no, explain.)", :pick => :one
      a_1 "Yes"
      a_2 "No"
    
    q_57a "Explain why written consent form(s) won't be used."
      dependency :rule => "E"
      condition_E :q_57, "==", :a_2
      a_1 :text
  end
end