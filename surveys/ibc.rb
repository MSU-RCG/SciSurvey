survey "IBC Protocol", :default_mandatory => false do

  section "Protocol Type" do
    # When :pick isn't specified, the default is :none (no checkbox or radio button)
    q_principle_investigator "Principle Investigator"
       a_1 :string
    
    q_project_title "Project Title"
      a_1 :string
   
    q_application_type "Application Type: (select all that apply)", :pick => :any
      a_1 "Recombinant or Synthetic Nucleic Acids (bacterial host-plasmid vector systems; recombinant or synthetic viruses in tissue culture; recombinant or synthetic nucleic acids in plants or animals; recombinant or synthetic influenzae viruses; >10 liter culture)"
      a_2 "Biological Materials Registration (human, animal, and/or plant pathogens; plants; animals,)"
      a_3 "Biological Toxin"
      a_4 "Transgenic Animal Registration, only"
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

    repeater "List All Research Locations" do
 
     q "Research Location"
      a "Building", :string
      a "Rm#", :string
     end
      
   
  
  q "Required Biosaftey Level", :pick => :one, :display_type => :dropdown
    ["BSL1", "BSL2", "BSL3"].each{ |level| a level}
  
  
    q_funding_agencies "Funding Agencies:"
    a_1 :text
    
    
    repeater "Personnel Conducting Experiments" do
    
  label "Identify personnel conducting the experiments (including students and temporary 
        staff). Specify project responsibilities and applicable training/experience including 
    duration. Each individual must read and understand the nature of the experiment(s) and the
     pertinent governing guidelines (including relevant portions of the USA Patriot Act) if 
        <a href=\'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf\'>
        Select Agents </a>are going to be worked with."  
      q_1 "Person"
        a "First Name", :string
        a "Last Name", :string
        a "Responsibilities", :text
        a "Training and Experience (include CITI training)", :text
    end

#good 
   q_2 "Have you and each of your listed personnel completed the CITI training <a href=\'http://www.citiprogram.org/\'>(http://www.citiprogram.org?)</a>", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}

 
   q_3 "Will human subjects and/or human clinical specimens be used in this research? Yes or no.  If yes, please explain."
      a_1 :text
 
   
    q_4 "Will you transport or ship biological agents/infectious substances/diagnostic specimens?" , :pick=>:one
      a_1 "Yes"
      a_2 "No"

 
   q_5 "Will you use <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>Select Agents?" , :pick=> :one
      a_1 "Yes"
      a_2 "No"

  
  q_6 "Will you use agents subject to export controls?" ,:pick=> :one
      a_1 "Yes"
      a_2 "No"

  
  q_7 "Are permits (import, transport, release to the environment required to work with this material?  If yes, please submit a copy of all permits with this registration." , :pick=> :one
      a_1 "Yes"
      a_2 "No"



q_88 "Does the work involve the importation, production, manufacturing, or processing of new (intergeneric) microorganisms or significant new use of microorganisms for the purpose of obtaining an immediate or eventual commercial advantage for the researcher or the funding entity?" , :pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_99  "If yes, please explain."
     a_1  :text 
  
   q_8 "Does any aspect of your work have \'dual-use potential,\' as defined as research that can be reasonably anticipated to provide knowledge, products, or technologies that could be directly misapplied by others to pose a threat to public health and safety, agricultural crops and plants, animals, or the environment?" ,:pick=> :one
      a_1 "Yes"
      a_2 "No"

   
 q_8a "If yes, provide a detailed explanation."
      a_1 :text 
 

q_9 "Does the work involve the importation, production, manufacturing, or processing of new (intergeneric) microorganisms or significant new use of microorganisms for the purpose of obtaining an immediate or eventual commercial advantage for the researcher or the funding entity?  If yes, please explain."
  a_1 :text
 
 
end

  #good

section "Biological Materials Registration" do
    #dependency :rule=> "D"
    #condition_D  :q_application_type, "==", :a_2
   
     label "Please check all that apply. If none of these categories apply to your research, please skip this section.  If you also use recombinant or synthetic nucleic acids and/or biological toxins in conjunction with the biological materials below, please complete the survey sections for these items by checking on the appropriate check boxes at the beginning of the survey."
  
 q_classifications "Classifications", :pick => :any
      a_1 "Human, Animal, and/or Plant Pathogens"
      a_2 "Plants"
      a_3 "Animals"
      

# "please add additional answers to pathogen use repeater questions.  Questions and/or answere to add are indented to far left."

  label "Pathogen Use--Please complete the following information for each human, animal and plant pathogen used in this project."
  
  
      repeater "Pathogen" do
     
  q_10 "Pathogen ID"
      a_1 "Genus and species (and strain if known)", :string
      a_2 "Type of Agent:  bacterium, virus, fungus, prion",  :string
      a_3 "Biosafety Level:  1,2,3,4", :string
      a_4 "Is the microorganism on the CDC <a href=\'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf\'>Select Agents List?</a>", :string 
      a_5 "Source of Agent", :string
      a_6 "Pathogenic to", :string
      a_7 "Clinical Symptoms or Name of Disease", :text
      a_8 "Infectious Dose", :string
      a_9 "Common Route of Transmission:", :string
      a_10 "Effective Treatments (e.g. antibiotics, immunization)", :text
      a_11 "Appropriate Disinfectant and contact time:", :string
      a_12 "How will you inactivate the agent upon completion of work?", :text
      a_13 "Does this organism synthesize a toxic molecule lethal for vertebrates at an LD50<100 ng/kg or a toxin on the Select Agent list?  If yes, please identify the toxin here and be sure to complete the BIOLOGICAL TOXIN section of this form by selecting the check box for BIOLOGICAL TOXINS at the beginning of the form.", :text   
  end
 
   
   
   repeater " Identify all locations where the microorganisms will be stored, and/or weighed. " do
      q_11 " Add Storage Location(s)"
        a_1 "Building", :string
        a_2 "Rm#", :string
        a_3 "Facility", :string
        a_4 "Type", :string
        a_5 "Qty", :strin
     end
  

# "removed qty from answers below"

  
  repeater " Identify all locations where experiments will be conducted" do
    q_12 " Add Experimental Location(s)" 
      a_1 "Building", :string
      a_2 "Rm#", :string
      a_3 "Facility", :string
      a_4 "Type", :string
  end
   
  q_13 "Means of transportation (if storage and experiment locations are not the same):"
    a_1 :text

end
#good
# "would like the plant use to show up as a section on the completed form"
   
section "Plant Use" do 
  label "Anwer the questions in this section only if plants will be infected with or exposed to a pathogen."

  repeater "Infected Plants" do
    q_14 "Plant Use"  
      a_1 "Name of Plant", :string
      a_2 "Is this plant a noxious weed, invasive plant, or exotic plant?  If yes, please provide more info.", :text
  end
  
  q_15 "Where will infected plants be kept?  Check all that apply.",  :pick=> :any
    a_4 "Laboratory"
    a_5 "Growth Chamber"
    a_6 "Greenhouse"
    a_7 "Field Release"
    q_15a "Describe procedures for containment of infected plants."
      a_1 :text
    q_15b "How will infected plant materials be disposed of upon completion of experiments?"
      a_1 :text
  
end

#good
section "Animal Use" do          
  label "Answer the questions in this section only if animals will be infected with or exposed to a pathogen."
  
      
  repeater "Animal Use" do
    q_16 "Animal"
      a_1a "Species and/or common name:",:text
      q_18 "Route of infection?  Check all that apply", :pick=> :any
        a_1 "Intravenous"
        a_2 "Intranasal"
        a_3 "Intraperitoneal"
        a_4 "Subcutaneous"
        a_5 "Intramuscular"
        a_6 "Intracerebroventricular"
        a_7 "Other"
  end
       
  repeater "Animal Housing" do    
    q_19 "Where will animals be housed?"
      a_1 "Building", :string   
      a_2 "Room", :string
  end


  repeater "Animal Experiment Location" do
    q_20 "Where will you perform procedures using animals?"
      a_1 "Building", :text
      a_2 "Room", :string
  end  
end #end section


 
#good

 section "Recombinant and Synthetic Nucleic Acid Molecules" do
  
  group "Recombinant and Synthetic Nucleic Acid Molecules" do
      dependency :rule => "D"
      condition_D :q_application_type, "==", :a_1  
    label "Fill out this section if your project involves the use of Recombinant and/or Synthetic Nucleic Acid Molecules.    More information: <a href='http://oba.od.nih.gov/oba/faqs/Synthetic_FAQs-Sept-2012.pdf'>Frequently Asked Questions NIH 
        Guidelines for Research Involving Recombinant or Synthetic Nucleic Acid Molecules</a>"

    label"Check YES or NO to each question to determine which sections of the NIH Guidelines pertain to your project.  You will be asked to describe your project in more detatil at the end of the survey.  Please address each item checked YES in that description.</a>"

     q_21 "1.  Does your project include deliberate transfer of a drug resistance trait to microorganisms that are NOT known to acquire the trait naturally? (Section III-A)? If yes, also answer question 22.", :pick=> :one
        a_1 "Yes"
        a_2 "No"
  
    q_22 "1.a  Could such a transfer compromise the use of the drug to control disease agents in humans, veterinary medicine, or agriculture?", :pick=> :one
      a_1 "Yes"
      a_2 "No"
    
    q_23 "2.  Does your project include cloning toxin molecules with an LD50 of less than 100 nanograms per kilogram body weight ? (Section III-B)   If YES, please make sure to also complete the Biological Toxin section by selecting the checkbox for Biological Toxins at the beginning of the form.", :pick => :one
      a_1"Yes"
      a_2"No" 
      
    q_24 "3.  Does your project include experiments using Risk Group 2, Risk Group 3, Risk Group 4, or Select Agents as host-vector systems? (Section III-D-1)  If YES, please make sure to also complete the Biological Materials Registration section by selecting the checkbox for BIOLOGICAL MATERIALS REGISTRATION at the beginning of the form.", :pick=> :one
      a_1 "Yes"
      a_2 "No"

   
    q_25 "4.  Does your project include experiments in which nucleic acids from Risk Group 2, Risk Group 3, Risk Group 4, or Restricted Agents is cloned into nonpathogenic prokaryotic or lower eukaryotic host-vector systems? (Section III-D-2)?", :pick=> :one
      a_1 "Yes"
      a_2 "No"
 
    q_26 "5.  Does your project include experiments involving the use of infectious DNA or RNA viruses or defective DNA or RNA viruses in the presence of helper virus in tissue culture systems?  (Section III-D-3)", :pick=> :one
      a_1 "Yes"
      a_2 "No"      
        
    q_27 "6.  Does your project include experiments involving genetically engineered plants? (Section III-D-5, III-E-2).  If yes, please be sure to fill out the Biological Materials section of the survey by selecting the checkbox for BIOLOGICAL MATERIALS REGISTRATION at the beginning of the form.", :pick=> :one
      a_1 "Yes"
      a_2 "No"
        
    q_28 "7.  Does your project include experiments involving more than 10 liters of culture? (Section III-D-6)", :pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_29 "8.  Does your project include experiments involving the formation of recombinant DNA molecules containing two-thirds or less of the genome of any eukaryotic virus? (Section III-E-1)", :pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_30 "9.  Does your project include experiments involving viable rDNA-modified microorganisms tested on animals?  (Section III-D-4, III-E-3). If yes, please make sure to also complete the Biological Materials Registration section by selecting the checkbox for BIOLOGICAL MATERIALS REGISTRATION at the beginning of the form." , :pick=> :one
      a_1 "Yes"
      a_2 "No"
   
    q_31"10.  Does your project include experiments involving whole animals in which the animalís genome has been altered by introduction of DNA into the germ line (i.e.transgenic animals)? (Section III-D-4, III-E-3)  If yes, then please register your transgenic animals by checking the TRANSGENIC ANIMAL REGISTRATION check box at the beginning of the form.", :pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_32 "11.  Does your project include experiments involving the deliberate transfer of recombinant or synthetic nucleic acids into one or more human research participants (Section III-C)?", :pick=> :one
      a_1 "Yes"
      a_2 "No"
  end#endgroup  

#good

  group "General Recombinant and/or Synthetic Nucleic Acid Questions."do
    label "Please answer the following general questions about your project with regards to recombinant or synthetic nucleic acid use."
  
    q_33 "Will proteins or regulatory RNAs be expressed?", :pick=> :one
      a_1 "Yes"
      a_2 "No"
 
     
    q_34 "Is the source of nucleic acid to be cloned associated with alterations of normal mammalian cell cycle or cell growth (i.e. a potentially oncogenic or tumorigenic gene?)", :pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_35 "Will your experiments be conducted outside of containment? (e.g. outside the facility, field trial?)", :pick=> :one
      a_1 "Yes"
      a_2 "No"
    
    q_36 "Will your experiments transfer drug, vaccine, or chemical resistance genes(excluding common resistance markers in plasmid vectors or transposons used for cloning or mutagenesis.)?", :pick=> :one
        a_1 "Yes"
        a_2 "No"
    
    q_37 "Will your experimenst make a pathogen more virulent?", :pick=> :one
        a_1 "Yes"
        a_2 "No" 
  
    q_38 "Will your experiments alter genes associated with an agent's transmissibility?", :pick=> :one
        a_1 "Yes"
        a_2 "No"

    q_39 "Will yourexperimnets enable evasion of diagnostic/detection modalities?", :pick=> :one
        a_1 "Yes"
        a_2 "No"

    q_40 "Will your experiments alter the host range or tropism of a pathogen?", :pick=> :one
        a_1 "Yes"
        a_2 "No"

    q_41 "Will your experiments change an organisms's normal ability to survive?", :pick=> :one
        a_1 "Yes"
        a_2 "No"

    q_42 "If you checked YES to any of the above, please explain in more detail:"
      a_1 :text
  end#end group

  #section "Recombinant or synthetic nucleic Acid Use in animals" do
    label "Please complete this section only if your experiments involve the use of recombinant or synthetic nucleic acids in animals."
    
    repeater "Animal Use" do
      q_43 "Animal"         
        a_1 "Species and/or common name:",  :text
        q_43a "Route of nucleic acid administration?  Check all that apply", :pick=> :any 
          a_2 "Intravenous"
          a_3 "Intranasal"
          a_4 "Intraperitoneal"
          a_5 "Subcutaneous"
          a_6 "Intramuscular"
          a_7 "Intracerebroventricular"
          a_8 "Other"         
        q_43b "Where will animals be housed?"
          a_9 "Building", :string   
          a_10 "Room", :string
        q_43c "Where will you perform procedures using animals?"
          a_11 "Building", :text
          a_12 "Room", :string
     end
 

    q_44 "Will you create transgenic/knockouts?  If yes, please complete the Transgenic Animal Registration section of the survey by selecting the checkbox for TRANSGENIC ANIMAL REGISTRATION at the beginning of the survey.", :pick=> :one
        a_1 "Yes"
        a_2 "No"

 # end

  group "Recombinant or Synthetic Nucleic Acid in Plants" do
    label "Please complete this section only if your experiments involve the use of recombinant or synthetic nucleic acids in animals." 
    
    q_45 "What types of plants will you use?"
      a_1 :text
    
    q_46 "Is this species a noxious weed, invasive plant, or exotic plant?  If yes, please provide more information."
      a_1 :text
    
    q_47  "How will you introduce recombinant or synthetic nucleic acids into the plant?  If you will be using a plant pathogen (eg. Agrobacterium tumefaciens) please complete the Biological Materials Section of the survey by selecting the checkbox for BIOLOGICAL MATERIALS REGISTRATION at the beginning of the form."
      a_1 :text

    q_48 "Where will genetically engineered plants be kept?  Check all that apply.",  :pick=> :any
      a_4 "Laboratory"
      a_5 "Growth Chamber"
      a_6 "Greenhouse"
      a_7 "Field Release"
  
    q_49 "Describe procedures for containment of plants containing recombinant or synthetic nucleic acids."
      a_1 :text
 
    q_50 "How will recombinant plant materials be disposed of upon completion of experiments?"
      a_1 :text
  end

#
#  group "Recombinant Contructs" do
    label "Please detail all recombinant constructs below."
    repeater "Recombinant Construct" do
      q_51 "Recombinant Construct"
        a_1 "Gene name:", :string
        a_2 "Source of nucleic acid sequence (e.g. human, mouse, corn, pathogen):", :string
        a_3 "Function/Biological Activity:",  :text
        a_4 "Vector (plasmid, phage or virus):", :string
        a_5 "Construct Name (e.g. pTR-UF-GFP):", :string
        a_6 "Host strain for vector (e.g. E. coli K-12):", :string
        a_7 "List target recipients of recombinant or synthetic nucleic acid (cell lines, animals, bacteria)  Provide Genus/species or common name:",  :text
        a_8 "If using tissue culture/cell lines, specify name and origin and whether or not they are tumorigenic or oncogenic." , :text
        a_9 "How will you introduce the gene into each host--types of manipulations planned (e.g. transfection, trandsuction, injection)?",  :text
        a_10 "Where is recombinant made?", :text
        a_11 "Discuss any risks associated with the release of the recombinant vector or the genetically modified host organism to humans or to the environment.", :text
    end
#  end


 # group "Eukaryotic viral vectors" do
    label "Please provide more information for any eukaryotic viral vectors listed above if you use >2/3 the viral genome."

    repeater "Viral Vector" do
      q_52 "Additional viral Vector Information"
        a_1 "Name of viral vector:", :string
        a_2 "Is the virus replication defective?  Must answer Yes or No.  If yes, how so.  If no, provide justification for using a replication competant virus.",  :text
        a_3 "Will you use a defective viral vector in the presence of helper Virus?  If yes, specify.",  :text
        a_4 "List all helper plasmids used to produce recombinant virus.",  :text
        a_5 "Discuss the probability and consequences of recombination events leading to restoration of a replication competant virus.",   :text
        a_6 "Discuss safety features of the viral vector (e.g. gene deletions, expression of packaging genes on multiple plasmids, limited tissue tropism, self-inactivating long terminal repeats).",  :text
        a_7 "Has the vector preparation been tested or will it be tested for the presence of replication competent virus?  If yes, describe the method used for testing and attach data if available.", :text
    end
 # end
  
  
  group "Recombinant or synthetic nucleic acid risk assessment and risk mitigation." do
    label "Please answer some more questions to assess the risk of your proposed recombinant and/or synthetic nucleic acid experiments."

    q_53 "What are the risks to humans of accidental exposure to each of the recombinant or synthetic DNA/RNA insert(s) you will be using. Consider whether the recombinant nucleic acids encode for replication competent viruses, toxins, cytokines, oncogenes, growth factors, hormones, or allergens. For inhibitory RNA molecules, discuss the consequences of the loss of the targeted gene product and potential off-target effects."
      a_1 :text
  end
end#end section
# good

section "Transgenic Animal Registration Only" do  


  label "Please complete this section if you use transgenic animals in your research.  If you use a recombinant or synthetic gene construct to create a transgenic animal, then also complete the Recombinant and Synthetic Nucleic Acid section of the survey by selecting the checkbox at the beginning of the survey for RECOMBINANT AND SYNTHETIC NUCLEIC ACID RESEARCH."

  group "General Trangenic Animal Questions" do
      
    q_54 "How will transgenic/genetically modified animals be used to meet your research goals?"
      a_1 :text
      
    q_55 "What is the IACUC protocol number or IACUC project title that corresponds to this IBC protocol submission?"
      a_1 :string
      
    q_56 "Will your lab create transgenic animals?  If no, skip questions 55 and 56.", :pick=> :one
            a_1 "Yes"
            a_2 "No"
            
    q_57 "Where will you create your transgenic animals?"
      a_1  :string
    
    q_58 "What method(s) will be used to create your transgenic animals?", :pick=> :any
      a_1 "Microinjection of gene construct into pronuclear fertilized oocytes"
      a_2 "Insertion of gene construct into embryonic stem cells that are microinjected into oocytes"
      a_3 "Vector-mediated transfer of construct to embryonic stem cells for microinjection into oocytes"
      a_4 "Other", :text

  end
#  group "Transgenic Animal Registration" do
    label "Please complete the following items for each transgenic animal used in this experiment."
    repeater "Transgenic Animal Registration" do
    q_59 "Transgenic Animal Registration"
      a_1 "Animal species:", :string
      a_2 "Gene name and function:", :text
      a_3 "Biological Source of gene:", :string
      a_4 "Type of transgenic: knockout or other. If other, specify:", :text
      a_5 "Source of transgenic animal if other than PI's lab:", :string
      a_6 "Hazard for animal handlers? Yes or No.  If yes, describe precautions for animal handlers and housing.", :text
    end
#  end
 end #end section

  
  section "Biological Toxin" do


    label "Complete this section if you are working with a biological toxin or select agent listed on the National Select Agent Registry,
      a microorganism which synthesizes a toxic molecule lethal for vertebrates below, or the biosynthesis of toxic molecules."
    q_60 "Identify the toxin(s) and their source, unfractionated mixture, purified conjugate, or microbial culture, capable of producing toxin that will be used in experiment "
       a_1 :text
       
    q_61 "Is the toxin on the <a href=\'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf\'>Select Agent List?</a>", :pick => :one
      a_1 "Yes"
      a_2 "No"
    
    q_62 "Indicate the amount (if any) currently on-site: "
      a_1 :text
    
    q_63 "Is the toxin being purchased from a commercial source? ", :pick => :one
      a_1 "Yes"
      a_2 "No"

    q_64 "Are there plans to express the toxin in a recombinant expression system??", :pick => :one
      a_1 "Yes"
      a_2 "No"

    label "If the toxin is on the Select Agent list, these are restricted experiments that require approval by HHS prior to initiation. Proceeding without prior approval is violation of section 13 </br>
      of the Select Agent regulations (see section 73.13, <a href=\'http://www.selectagents.gov/Regulations.html\'>http://www.selectagents.gov/Regulations.html</a>).</br>
      Cloning of toxins with an LD50 of less than 100 nanograms per kilogram body weight cannot be done without approval by both the NIH/OBA and the MSU IBC. (see Sections </br>
      III-B and III-B-1 of the NIH Guidelines for Recombinant and Nucleic Acid Research, <a href'http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm'>
      http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm</a>)</br>
      Toxins with an LD50 of <100 ng/kg body weight include select agent toxins, botulinum toxins tetanus toxin, diphtheria toxin, and Shigella dysenteriae neurotoxin."

    q_65 "Describe the types of experiments that will be performed. "
      a_1 :text

    q_66 "Indicate the anticipated amounts that will be needed. "
      a_1 :text

    q_67 "What is the LD50 of the toxin? Cite the source of information. "
      a_1 :text

    q_68 "Will the toxin be transferred to another investigator at any time, either on-site or at another institution?", :pick => :one
      a_1 "Yes"
      a_2 "No"

    label "See the required documentation for due diligence: <a href=\'http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html\'>
      http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html.</a> Documentation must be provided to the IBC and approved prior to transfer."

    repeater "Identify all locations where the microorganism will be stored, and/or weighed and where experiments will be conducted" do
      dependency :rule => "B"
      condition_B :q_application_type, "==", :a_3
      q_69 " Add Location"
        a_1 "Building", :string
        a_2 "Rm#", :string
        a_3 "Facility", :string
        a_4 "Type", :string
        a_5 "Qty (storage location)", :string
    end

  # group "Biological Toxin" do
  #   dependency :rule => "B"
  #   condition_B :q_application_type, "==", :a_3

    label "Means of transportation (if storage and experiment locations are not the same):"
      a_1 :text

    q_70 "10) Does the experiment involve the administration of toxin to animals?", :pick => :one
      a_3 "Yes"
      a_2 "No"

    q_71 "11) Identify the method of disposal/deactivation of contaminated materials and remaining agent: "
      a_1 :text

    q_72 "12) Describe your written protocol covering the secure storage, safe handling and emergency procedures in case of an accident (exposure to staff or spill) for this toxin. "
      a_1 :text

    q_73 "13) Is there an antidote available for persons exposed to the toxin?", :pick => :one
      a_1 "Yes"
      a_2 "No"

    q_74 "14) Have all personnel involved with this project received documented initial training and yearly updates regarding the procedures for handling the toxin?", :pick => :one
      a_1 "Yes"
      a_2 "No"
  # end    
  end #end section
 


section "PI Statement of Understanding" do
    # dependency :rule => "H or M or D"
    # condition_H :q_application_type, "==", :a_3
    # condition_M :q_application_type, "==", :a_2
    # condition_D :q_application_type, "==", :a_1
 

 q_75 "As Principal Investigator, I understand there are federal regulations applicable to work with Select Agent toxins. ", :pick => :one
      a_1 "I have reviewed the regulations and the proposed experiments are excluded from the Select Agent Regulations." 
      a_2 "As Principal Investigator, I am approved to work on the proposed experiments by either the Centers for Disease Control or the United States Department of Agriculture (USDA)Select Agent program and meet all of the requirements imposed upon me and my projects by MSU and the Select Agent Regulations."
 
  group "Description of Use of Biologicl Materials" do
      q_76 "Please describe the proposed work in lay terms.  If your project includes more than one area or phase or includes several steps, please describe the project in a sequential manner.  Please be cognizant of your answers to the questions in this form and use this space to pull all of the information together.  Your narrative must include:<br?>  
      1)	a brief introduction,<br/>
      2)	the specific goal(s) of your experiment(s),<br/>
      3)	the experimental methods to be used, and ,<br/>
      4)	the endpoints to be measured.<br/>"
        a_1 :text
        
      q_77 "Discuss the hazards/risks associated with this experiment (e.g. potential exposure risks such as needlesticks, handling of the agent, aerosolization of agent;  infection with recombinant vectors;  release of organisms or recombinant or synthetic nucleic acid to the environment).  If biological agents will be used in animals, be sure to include additional risks related to animal handling and husbandry (e.g. shedding agent in urine/feces; transmission via bite/scratch)."
        a_1 :text

      
      q_78 "Describe how the following will be implemented to protect personnel from accidental exposure and/or prevent environmental release. Please contact the Office of Biosafety for assistance with any of the responses below."
        a_1"work practices:" , :text
        a_2 "personal protective equipment (PPE) (gloves, lab coats, eye protection, respirators, NO SHORTS, NO OPEN TOE SHOES:",  :text
        a_3 "safety equipment:",  :text
        a_4 "Administrative controls (eg. restricted access, training requirements, age restrictions):",:text
        a_5 "Appropriate disinfectant and contact time for work surfaces:" ,:text
        a_6 "How will solid waste be disposed?", :text
        a_7 "How will liquid waste be disposed?", :text
        q_78a "Have all personnel been trained in proper biological waste disposal?", :pick=> :one
                a_1 "Yes"
                a_2 "No" 
        q_78b "Do you have a biosafety manual or SOP's for your lab personnel and do they know where to find them?", :pick=> :one
                a_1 "Yes"
                a_2 "No"
        q_78c "Do you have a biological spill clean-up kit and have your personnel been trained to clean up a biological spill?", :pick=> :one
                a_1 "Yes"
                a_2 "No"

   end






 label
"BY SUBMITTING THIS FORM YOU ACKNOWLEDGE THAT YOU HAVE READ AND AGREE TO THE FOLLOWING STATEMENTS</ br>
      Pursuant to applicable State and Federal laws and regulations and Montana State University policies and procedures:</ br>
      To the best of my knowledge, I affirm that all information contained herein is accurate and complete.</ br>
      I agree to comply with federal, state, and university requirements pertaining to handling, shipment, transfer, and disposal of biological materials, to include annual lab inspections.</ br>
      I agree to accept responsibility for the training of all personnel involved in this research and that all personnel have been trained.</ br>
      I understand that IBC approval of this protocol constitutes approval to work with the specified agents (recombinant DNA, microorganisms, <a href=\'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf\'>
      select agents</a> , biological toxins) using the specified biosafety procedures/practices and laboratory facilities described herein.</ br>
      I affirm that all personnel working on the project covered by this protocol have read and are in compliance with the federal law defined in the USA Patriot Act (see <a href='https://apps.montana.edu/msupam/appendF'>
      Appendix F</a>), if applicable.</ br>
      I understand that all changes in agents, procedures/practices, and facilities must be reported in writing to the IBC in the prescribed format, and that IBC approval shall be obtained prior to implementation of these changes.</ br>
      I understand that unauthorized use of recombinant DNA, microorganisms, <a href=\'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf\'>
      select agents</a> , biological toxins or deviation from an approved IBC protocol may result in suspension of research privileges and/or disciplinary action.</ br>
      I understand that any persons added to the project after initial approval requires IBC approval and a modification will be submitted and each new person will complete and submit the Patriot Act Compliance Questionnaire (<a href='https://apps.montana.edu/msupam/appendF'>
      Appendix F</a>) if Select Agents are involved."
     #end
   end #end section
end