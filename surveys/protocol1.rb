# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.

survey "IBC Protocol", :default_mandatory => false do

  section "Protocol Type" do
    # When :pick isn't specified, the default is :none (no checkbox or radio button)
    q_principle_investigator "Principle Investigator"
    a_1 :string
    
    q_projet_title "Project Title"
    a_1 :string
   
    q_application_type "Application Type: (select all that apply)", :pick => :any
    a_1 "Recombinant DNA"
    a_2 "Microorganism Usage"
    a_3 "Biological toxin"
  end

  section "New Submission Information" do
              
    repeater "List Co-Investigators" do
      q "Co-Investigator"
      a "First Name", :string
      a "Last Name", :string
      a "Title", :string
      a "Department", :string
      a "Phone", :integer, :input_mask => '(999)999-9999', :input_mask_placeholder => '#'
      a "Fax", :integer, :input_mask => '(999)999-9999', :input_mask_placeholder => '#'
      a "Email", :string
    end

    repeater "List Research Locations" do
      q "Research Location"
      a "Building", :string
      a "Rm#", :string
      a "BS: Rating", :string
    end
    
    q_classifications "Classifications", :pick => :any
    a_1 "Recombinant DNA Molecules"
    a_2 "Pathogenic Microorganisms"
    a_3 "Biological Toxins"
    a_4 "Prions"
    a_5 "Plants"
    a_6 "Invertebrate Animals"
    a_7 "Vertebrate Animals"
    a_8 "Human Subjects"

    q_cla2 "Select If considered", :pick => :any
    a_9 "Synthetic Nucleic Acids"
    dependency :rule=>"Z"
    condition_Z :q_classifications, "==", :a_1
    
    q "Required Biosaftey Level", :pick => :one, :display_type => :dropdown
    ["Exempt","BSL1", "BSL2", "BSL3"].each{ |level| a level}
    
    q_funding_agency "Funding Agency:"
    a_1 :string
    
    
    repeater "Personnel Conducting Experiments" do
      label "Identify personnel conducting the experiments (including students and temporary 
        staff). Specify project responsibilities and applicable training/experience including 
    duration. Each individual must read and understand the nature of the experiment(s) and the
     pertinent governing guidelines (including relevant portions of the USA Patriot Act if 
        <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>
        Select Agents </a>are going to be worked with, see <a href='https://apps.montana.edu/msupam/appendF'>
  Appendix F</a>)."
      q "Person"
      a "First Name", :string
      a "Last Name", :string
      a "Responsabilities", :text
      a "Training Experience", :text
      
    end
    q "Have you completed the CITI training <a href='http://www.citiprogram.org/''>(http://www.citiprogram.org?)</a>", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}

  end



    


 section "IBC Questions" do

  group "Recombinant and Synthetic Nucleic Acid Molecules" do
    dependency :rule => "D"
    condition_D :q_application_type, "==", :a_1  


  label "Fill out this section if your project involves the use of Recombinant and Synthetic Nucleic Acid Molecules.
    More information: <a href='http://oba.od.nih.gov/oba/faqs/Synthetic_FAQs-Sept-2012.pdf'>Frequently Asked Questions NIH 
    Guidelines for Research Involving Recombinant or Synthetic Nuclei Acid Molecules</a>"

  label "1) Work with exempt systems:" 
     
  q "Will the work utilize a certified EXEMPT Host-Vector system (E coli, K12, Saccharomyces cerevisiae or Bacillus subtilis)?", :pick => :one
    answer "No"
    answer "Yes"
 
  q "Is the source of the DNA to be cloned a pathogen or are any toxins to be cloned?", :pick => :one
    answer "Yes"
    answer "No"
 
  label "2) Source of insert DNA/RNA:" 

  q "Is biological source is a viable, intact microorganism in your laboratory?", :pick => :one
    answer "Yes"
    answer "No"

  q "If biological source is human, will human blood/tissue will be handled by laboratory personnel?", :pick => :one
    answer "Yes"
    answer "No"

  q "If biological source is virus, indicate fraction of genome to be used:", :pick => :one, :display_type => :dropdown
    ["<1/2","1/2-2/3",">2/3"].each{ |level| a level}
 
  q "3) Vectors </ br> Describe the vectors and their origins"
    a :text
 
  q "4) Do experiments involve the use of defective viruses in the presence of helper virus?", :pick => :one
    answer "Yes"
    answer "No"

  q "5) Recipient host"
    a :text, :help_text => "If microorganism, click here to include Section 3 Microorganism Usage (EXCEPTION: Use of a non-pathogenic E. 
    coli K-12, Bacillus subtillis, or Saccharomyces cerevisiae recipient is exempt from the Microorganism Usage Section when used in certified Host-Vector 
    systems as listed in the current NIH Guidelines unless the organism(s) will be converted to a pathogenic strain.)"
 q "6) If a foreign gene(s) (one that is not found in the host species/strain) will be expressed, identify the gene(s) and its function (if known)"
    a :text
  label "7) Do the experiments involve:" 
  q "Use of Animals?", :pick => :one
    answer "Yes"
    answer "No"
  q "Use of Plants?", :pick => :one
    answer "Yes"
    answer "No"

 q "8) Do the DNA clones contain genes for the biosynthesis of toxic molecules lethal for vertebrates at an LD50 of:", :pick => :one, :display_type => :dropdown
    ["N/A","<100","100-999","1-100",">100"].each{ |level| a level}
 q "9) Section(s) of the of NIH Guidelines governing the proposed experiments:"
    a :text
 q "10) Do experiments involve the release into the environment (outside the facility) of an organism containing recombinant DNA?", :pick => :one
    answer "Yes"
    answer "No"
 q "11) Do experiments involve the creation of Transgenic Animals?", :pick => :one
    answer "Yes"
    answer "No"
 
end

group "Microorganism Usage Part 1" do  
    dependency :rule => "M"
    condition_M :q_application_type, "==", :a_2 

  label "Complete this section for all uses of microorganisms except non-pathogenic E. coli K-12, Bacillus subtilis, or Saccharomyces 
     cerevisiae recipients in host-vector systems. See the <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>
     National Select Agent Registry</a>, and appendices <a href='https://apps.montana.edu/msupam/appendC'>C</a> and <a href='https://apps.montana.edu/msupam/appendD'>D</a>."
   
  q "1) What microorganism(s) will be used in this project (indicate strain where appropriate, such as for adenovirus)?"
    a :text
   
  label "2) Is the organism a:"
   
  q "Known Human Pathogen?", :pick => :one
    answer "Yes"
    answer "No"
   
  q "Known Animal Pathogen?", :pick => :one
    answer "Yes"
    answer "No"
   
  q "Known Plant Pathogen?", :pick => :one
    answer "Yes"
    answer "No"
   
  label "Explain as Necessary:"
    a :text

  q "3) Is the microorganism on the CDC <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>Select Agents List?</a>", :pick => :one
    answer "Yes"
    answer "No"

  q "4) Is the microorganism on the USDA/APHIS Restricted Animal Pathogen List?", :pick => :one
    answer "Yes"
    answer "No"

end

  repeater "5) Identify all locations where the microorganism will be stored, and/or weighed and where experiments will be conducted" do
    dependency :rule => "M"
    condition_M :q_application_type, "==", :a_2 
    q " Add Location"
    a "Building", :string
    a "Rm#", :string
    a "Facility", :string
    a "Type", :string
    a "Qty (storage location)", :string
  end

group "Microorganism Usage Part 2" do  
    dependency :rule => "M"
    condition_M :q_application_type, "==", :a_2 

  label "Means of transportation (if storage and experiment locations are not the same):"
    a :text

  q "6) Does the experiment involve or does the microorganism synthesize a toxic molecule lethal for vertebrates at an LD50 
    <100 mg/kg (100,000 ng/kg) or is the toxin on the National Select Agent Registry?", :pick => :one, :display_type => :dropdown
    ["Yes","No","Un known"].each{ |level| a level}

  q "7) Does the experiment involve the infection of vertebrate animals?", :pick => :one
    answer "Yes"
    answer "No"

  q "8) Is there a vaccine available and recommended for person handling this microorganism?", :pick => :one
    answer "Yes"
    answer "No"

  q "9) Does the work involve the importation, production, manufacturing, or processing of new (intergeneric) microorganisms or 
    significant new use of microorganisms for the purpose of obtaining an immediate or eventual commercial advantage for the researcher or the funding entity?", :pick => :one
    answer "Yes"
    answer "No"

  q "10) Are there training and procedures for handling the specific microorganism(s)?", :pick => :one
    answer "Yes"
    answer "No"

  end

  group "Biological Toxin" do
    dependency :rule => "B"
    condition_B :q_application_type, "==", :a_3

    label "Complete this section if you are working with a biological toxin or select agent listed on the National Select Agent Registry,
      a microorganism which synthesizes a toxic molecule lethal for vertebrates below, or the biosynthesis of toxic molecules."
    q "1) Identify the toxin(s) and their source, unfractionated mixture, purified conjugate, or microbial culture, capable of producing toxin that will be used in experiment "
       a :text
    q "2) Is the toxin on the <a href'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>Select Agent List?</a>", :pick => :one
      answer "Yes"
      answer "No"
    label "Indicate the amount (if any) currently on-site: "
      a :text
    q "3) Is the toxin being purchased from a commercial source? ", :pick => :one
      answer "Yes"
      answer "No"

    q "4) Are there plans to express the toxin in a recombinant expression system??", :pick => :one
      answer "Yes"
      answer "No"

    label "If the toxin is on the Select Agent list, these are restricted experiments that require approval by HHS prior to initiation. Proceeding without prior approval is violation of section 13 </br>
      of the Select Agent regulations (see section 73.13, <a href='http://www.selectagents.gov/Regulations.html'>http://www.selectagents.gov/Regulations.html</a>).</br>
      Cloning of toxins with an LD50 of less than 100 nanograms per kilogram body weight cannot be done without approval by both the NIH/OBA and the MSU IBC. (see Sections </br>
      III-B and III-B-1 of the NIH Guidelines for Recombinant and Nucleic Acid Research, <a href'http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm'>
      http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm</a>)</br>
      Toxins with an LD50 of <100 ng/kg body weight include select agent toxins, botulinum toxins tetanus toxin, diphtheria toxin, and Shigella dysenteriae neurotoxin."

    q "5) Describe the types of experiments that will be performed. "
      a :text

    q "6) Indicate the anticipated amounts that will be needed. "
      a :text

    q "7) What is the LD50 of the toxin? Cite the source of information. "
      a :text

    q "8) Will the toxin be transferred to another investigator at any time, either on-site or at another institution?", :pick => :one
      answer "Yes"
      answer "No"

    label "See the required documentation for due diligence: <a href='http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html'>
      http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html.</a> Documentation must be provided to the IBC and approved prior to transfer."

  end

    repeater "9) Identify all locations where the microorganism will be stored, and/or weighed and where experiments will be conducted" do
    dependency :rule => "B"
    condition_B :q_application_type, "==", :a_3
      q " Add Location"
        a "Building", :string
        a "Rm#", :string
        a "Facility", :string
        a "Type", :string
        a "Qty (storage location)", :string
    end

  group "Biological Toxin" do
    dependency :rule => "B"
    condition_B :q_application_type, "==", :a_3

    label "Means of transportation (if storage and experiment locations are not the same):"
      a :text

    q "10) Does the experiment involve the administration of toxin to animals?", :pick => :one
      answer "Yes"
      answer "No"

    q "11) Identify the method of disposal/deactivation of contaminated materials and remaining agent: "
      a :text

    q "12) Describe your written protocol covering the secure storage, safe handling and emergency procedures in case of an accident (exposure to staff or spill) for this toxin. "
      a :text

    q "13) Is there an antidote available for persons exposed to the toxin?", :pick => :one
      answer "Yes"
      answer "No"

    q "14) Have all personnel involved with this project received documented initial training and yearly updates regarding the procedures for handling the toxin?", :pick => :one
      answer "Yes"
      answer "No"
  end    

  group "PI Statement of Understanding" do
    dependency :rule => "H or M or D"
    condition_H :q_application_type, "==", :a_3
    condition_M :q_application_type, "==", :a_2
    condition_D :q_application_type, "==", :a_1
    q "As Principal Investigator, I understand there are federal regulations applicable to work with Select Agent toxins. ", :pick => :any?
      a "I have reviewed the regulations and the proposed experiments are either exempt, or if not, I have obtained the necessary approvals."
    label "Description of use of Biological Materials</ br>
      This section is required for all applications.</ br>
      In the following space, please describe your project clearly and simply with respect to recombinant DNA, microorganism, and biological toxin usage."
      a :text
    label "Appendix D: Laboratory Specific SOPs</ br>
      Paste into this section all protocol specific SOPs for working with BSL2 organisms."
      a :text
    label "BY SUBMITTING THIS FORM YOU ACKNOWLEDGE THAT YOU HAVE READ AND AGREE TO THE FOLLOWING STATEMENTS</ br>
      Pursuant to applicable State and Federal laws and regulations and Montana State University policies and procedures:</ br>
      To the best of my knowledge, I affirm that all information contained herein is accurate and complete.</ br>
      I agree to comply with federal, state, and university requirements pertaining to handling, shipment, transfer, and disposal of biological materials, to include annual lab inspections.</ br>
      I agree to accept responsibility for the training of all personnel involved in this research and that all personnel have been trained.</ br>
      I understand that IBC approval of this protocol constitutes approval to work with the specified agents (recombinant DNA, microorganisms, <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>
      select agents</a> , biological toxins) using the specified biosafety procedures/practices and laboratory facilities described herein.</ br>
      I affirm that all personnel working on the project covered by this protocol have read and are in compliance with the federal law defined in the USA Patriot Act (see <a href='https://apps.montana.edu/msupam/appendF'>
      Appendix F</a>), if applicable.</ br>
      I understand that all changes in agents, procedures/practices, and facilities must be reported in writing to the IBC in the prescribed format, and that IBC approval shall be obtained prior to implementation of these changes.</ br>
      I understand that unauthorized use of recombinant DNA, microorganisms, <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>
      select agents</a> , biological toxins or deviation from an approved IBC protocol may result in suspension of research privileges and/or disciplinary action.</ br>
      I understand that any persons added to the project after initial approval requires IBC approval and a modification will be submitted and each new person will complete and submit the Patriot Act Compliance Questionnaire (<a href='https://apps.montana.edu/msupam/appendF'>
      Appendix F</a>) if Select Agents are involved."
     end
   end
end

