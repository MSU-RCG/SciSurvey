# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.

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
        <a href='http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>
        Select Agents </a>are going to be worked with."  
      q_1 "Person"
        a "First Name", :string
        a "Last Name", :string
        a "Responsibilities", :text
        a "Training and Experience (include CITI training)", :text
    end

    q_2 "Have you and each of your listed personnel completed the CITI training <a href='http://www.citiprogram.org/''>(http://www.citiprogram.org?)</a>", :pick => :one, :display_type => :dropdown
    ["Yes","No"].each{ |level| a level}

    q_3 "Will human subjects and/or human clinical specimens be used in this research? Yes or no.  If yes, please explain."
      a_1"text"
    
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

    q_8 "Does any aspect of your work have 'dual-use potential,' as defined as research that can be reasonably anticipated to provide knowledge, products, or technologies that could be directly misapplied by others to pose a threat to public health and safety, agricultural crops and plants, animals, or the environment?" ,:pick=> :one
      a_1 "Yes"
      a_2 "No"

    q_9 "If yes, provide a detailed explanation."
      a_1"text" 
  end

  section "Biological Materials Registration" do
    #dependency :rule=> "D"
    #condition_D  :q_application_type, "==", :a_2
   
     label "Please check all that apply.  If you also use recombinant or synthetic nucleic acids and/or biological toxins in conjunction with the biological materials below, please complete the survey sections for these items by checking on the appropriate check boxes at the beginning of the survey."
    
    q_classifications "Classifications", :pick => :any
      a_1 "Human, Animal, and/or Plant Pathogens"
      a_2 "Plants"
      a_3 "Animals"
      a_4 "Human or Primate Cell Lines"

    #group "Pathogen Registration" do
    
      label "Please complete the following section for each human, animal and plant pathogen used in this project."
    
      repeater "Text Pathogen" do
       q_10 "Pathogen ID"
          a "Genus and species (and strain if known)", :string
          a "Type of Agent:  bacterium, virus, fungus, cell line, prion",  :string
          a "Biosafety Level:  1,2,3,4", :string
          a "Source of Agent", :string
          a "Pathogenic to", :string
          a "Clinical Symptoms or Name of Disease", :text
          a "Effective Treatments (e.g. antibiotics, immunization)", :text
          a "How will you inactivate the agent upon completion of work?", :text
      end
    
      repeater " Identify all locations where the microorganisms will be stored, and/or weighed. " do
        q_11 " Add Location"
          a "Building", :string
          a "Rm#", :string
          a "Facility", :string
          a "Type", :string
          a "Qty (storage location)", :string
      end
    
      repeater " Identify all locations where experiments will be conducted" do
        q_12 " Add Experimental Location"
          a "Building", :string
          a "Rm#", :string
          a "Facility", :string
          a "Type", :string
          a "Qty (storage location)", :string
      end
    
      q_13 "Means of transportation (if storage and experiment locations are not the same):"
       a :text
    #end#end group

      #group "Plant Use" do
        label "Plant Use"
        
        q_14 "Will plants be infected with or exposed to a pathogen?  If no, skip the remaining questions in this section.", :pick=> :one
          a_1 "Yes"
          a_2 "No"
          
        repeater "Infected Plants" do
          q_15 "Plant Text"
            a_1 "Name of Plant", :string
            a_2 "Is this plant a noxious weed, invasive plant, or exotic plant?", :string
            q_15a "Where will infected plants be kept?  Check all that apply.",  :pick=> :any
            a_4 "Laboratory"
            a_5 "Growth Chamber"
            a_6 "Greenhouse"
            a_7 "Field Release"
            a_8 "Describe procedures for containment of infected plants.", :text
            a_9 "How will infected plant materials be disposed of upon completion of experiments?", :text
        end
     # end


# 
#      group "Animal Use"  do
        label "Animal Use"
        
        q_16 "Will animals be infected with or exposed to a pathogen?  If no, skip the remaining questions in this section.", :pick=> :one
          a_1 "Yes"
          a_2 "No"
          
        q_17 "Please text the animals you will be using:"
          a_1 :text
        
        q_18 "Route of infection?  Check all that apply", :pick=> :any
          a_1 "Intravenous"
          a_2 "Intranasal"
          a_3 "Intrperitoneal"
          a_4 "Subcutaneous"
          a_5 "Intramuscular"
          a_6 "Intracerebroventricular"
          a_7 "Other"
          
        repeater "Animal Housing" do
          q_19 "Where will animals be housed?"
            a_1 "Building", :text
            a_2 "Room", :string
        end
        
        repeater "Animal Experiment Location" do
          q_20 "Where will you perform procedures using animals?"
            a_1 "Building", :text
            a_2 "Room", :string
        end
 #     end
 end #end section


  section "Recombinant and Synthetic Nucleic Acid Molecules" do
    group "Recombinant and Synthetic Nucleic Acid Molecules" do
      dependency :rule => "D"
      condition_D :q_application_type, "==", :a_1  


      label "Fill out this section if your project involves the use of Recombinant and/or Synthetic Nucleic Acid Molecules.    More information: <a href='http://oba.od.nih.gov/oba/faqs/Synthetic_FAQs-Sept-2012.pdf'>Frequently Asked Questions NIH 
      Guidelines for Research Involving Recombinant or Synthetic Nucleic Acid Molecules</a>"

      label"Check YES or NO to each question to determine which sections of the NIH Guidelines pertain to your project.  You will be asked to describe your project in question __.  Please address each item checked YES in that description.</a>"

      q_21 "1.  Does your project include deliberate transfer of a drug resistance trait to microorganisms that are NOT known to acquire the trait naturally? (Section III-A)? If yes, also answer, also answer question 1.a.", :pick=> :one
        a_1 "Yes"
        a_2 "No"
    
      q_22 "1.a  Could such a transfer compromise the use of the drug to control disease agents in humans, veterinary medicine, or agriculture?", :pick=> :one
        a_1 "Yes"
        a_2 "No"
    
      q_23 "2.  Does your project include cloning toxin molecules with an LD50 of less than 100 nanograms per kilogram body weight ? (Section III-B)   If YES, please make sure to also complete the Biological Toxin section by selecting the checkbox for Biological Toxins at the beginning of the form.", :pick => :one
        a_1"Yes"
        a_2"No" 
      
      q_24 "3.  Does your project include experiments using Risk Group 2, Risk Group 3, Risk Group 4, or Select Agents as host-vector systems? (Section III-D-1)  If YES, please make sure to also complete the Biological Materials Registration section by selecting the checkbox for Biological Materials Registration at the beginning of the form.", :pick=> :one
        a_1 "Yes"
        a_2 "No"
    
      q_25 "4.  Does your project include experiments in which nucleic acids from Risk Group 2, Risk Group 3, Risk Group 4, or Restricted Agents is cloned into nonpathogenic prokaryotic or lower eukaryotic host-vector systems? (Section III-D-2)?", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      q_26 "5.  Does your project include experiments involving the use of infectious DNA or RNA viruses or defective DNA or RNA viruses in the presence of helper virus in tissue culture systems?  (Section III-D-3)", :pick=> :one
        a_1 "Yes"
        a_2 "No"      
        #a yes answer should prompt to viral vector group

      q_27 "6.  Does your project include experiments involving genetically engineered plants? (Section III-D-5, III-E-2)", :pick=> :one
        a_1 "Yes"
        a_2 "No"
        # a Yes answer should prompt to rDNA Plant group
    
      q_28 "7.  Does your project include experiments involving more than 10 liters of culture? (Section III-D-6)", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      
      q_29 "8.  Does your project include experiments involving the formation of recombinant DNA molecules containing two-thirds or less of the genome of any eukaryotic virus? (Section III-E-1)", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      
      q_30 "9.  Does your project include experiments involving viable rDNA-modified microorganisms tested on animals?  (Section III-D-4, III-E-3). ?" , :pick=> :one
        a_1 "Yes"
        a_2 "No"
      # a yes answer should prompt to the rDNA in animals group"

       q_31"10.  Does your project include experiments involving whole animals in which the animal’s genome has been altered by introduction of DNA into the germ line (i.e.  transgenic animals)? (Section III-D-4, III-E-3)  If yes, then please register your transgenic animals by checking the TRANSGENIC ANIMAL REGISTRATION check box at the beginning of the form.", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      
      q_32 "11.  Does your project include experiments involving the deliberate transfer of recombinant or synthetic nucleic acids into one or more human research participants (Section III-C)?", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      
      label "Please answer the following general questions about your project with regards to recombinant or synthetic nucleic acid use ."
    
      q_33 "Will proteins or regulatory RNAs be expressed?", :pick=> :one
        a_1 "Yes"
        a_2 "No"
      
      q_34 "Is the source of nucleic acid to be cloned associated with alterations of normal mammalian cell cycle or cell growth (i.e. a potentially oncogenic or tumorigenic gene?)"
        a_1 :text
    end #end group
  end #end section

  
  section "Biological Toxin" do
    # dependency :rule => "B"
    # condition_B :q_application_type, "==", :a_3

    label "Complete this section if you are working with a biological toxin or select agent listed on the National Select Agent Registry,
      a microorganism which synthesizes a toxic molecule lethal for vertebrates below, or the biosynthesis of toxic molecules."
    q_35 "1) Identify the toxin(s) and their source, unfractionated mixture, purified conjugate, or microbial culture, capable of producing toxin that will be used in experiment "
       a :text
       
    q_36 "2) Is the toxin on the <a href'http://www.selectagents.gov/resources/List_of_Select_Agents_and_Toxins_2012-12-4-English.pdf'>Select Agent List?</a>", :pick => :one
      a_1 "Yes"
      a_2 "No"
    
    label "Indicate the amount (if any) currently on-site: "
      a :text
    q_37 "3) Is the toxin being purchased from a commercial source? ", :pick => :one
      a_1 "Yes"
      a_2 "No"

    q_38 "4) Are there plans to express the toxin in a recombinant expression system??", :pick => :one
      a_1 "Yes"
      a_2 "No"

    label "If the toxin is on the Select Agent list, these are restricted experiments that require approval by HHS prior to initiation. Proceeding without prior approval is violation of section 13 </br>
      of the Select Agent regulations (see section 73.13, <a href='http://www.selectagents.gov/Regulations.html'>http://www.selectagents.gov/Regulations.html</a>).</br>
      Cloning of toxins with an LD50 of less than 100 nanograms per kilogram body weight cannot be done without approval by both the NIH/OBA and the MSU IBC. (see Sections </br>
      III-B and III-B-1 of the NIH Guidelines for Recombinant and Nucleic Acid Research, <a href'http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm'>
      http://oba.od.nih.gov/oba/rac/Guidelines/NIH_Guidelines.htm</a>)</br>
      Toxins with an LD50 of <100 ng/kg body weight include select agent toxins, botulinum toxins tetanus toxin, diphtheria toxin, and Shigella dysenteriae neurotoxin."

    q_39 "5) Describe the types of experiments that will be performed. "
      a_1 :text

    q_40 "6) Indicate the anticipated amounts that will be needed. "
      a_1 :text

    q_41 "7) What is the LD50 of the toxin? Cite the source of information. "
      a_1 :text

    q_42 "8) Will the toxin be transferred to another investigator at any time, either on-site or at another institution?", :pick => :one
      a_1 "Yes"
      a_2 "No"

    label "See the required documentation for due diligence: <a href='http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html'>
      http://www.selectagents.gov/Toxin_Due_Diligence_Provision.html.</a> Documentation must be provided to the IBC and approved prior to transfer."

    repeater "9) Identify all locations where the microorganism will be stored, and/or weighed and where experiments will be conducted" do
      dependency :rule => "B"
      condition_B :q_application_type, "==", :a_3
      q_43 " Add Location"
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

    q_44 "10) Does the experiment involve the administration of toxin to animals?", :pick => :one
      a_3 "Yes"
      a_2 "No"

    q_45 "11) Identify the method of disposal/deactivation of contaminated materials and remaining agent: "
      a_1 :text

    q_46 "12) Describe your written protocol covering the secure storage, safe handling and emergency procedures in case of an accident (exposure to staff or spill) for this toxin. "
      a_1 :text

    q_47 "13) Is there an antidote available for persons exposed to the toxin?", :pick => :one
      a_1 "Yes"
      a_2 "No"

    q_48 "14) Have all personnel involved with this project received documented initial training and yearly updates regarding the procedures for handling the toxin?", :pick => :one
      a_1 "Yes"
      a_2 "No"
  # end    
  end #end section
  section "PI Statement of Understanding" do
    # dependency :rule => "H or M or D"
    # condition_H :q_application_type, "==", :a_3
    # condition_M :q_application_type, "==", :a_2
    # condition_D :q_application_type, "==", :a_1
    q_49 "As Principal Investigator, I understand there are federal regulations applicable to work with Select Agent toxins. ", :pick => :any?
      a_1 "I have reviewed the regulations and the proposed experiments are either exempt, or if not, I have obtained the necessary approvals."
   
    q_50 "Description of use of Biological Materials</ br>
      This section is required for all applications.</ br>
      In the following space, please describe your project clearly and simply with respect to recombinant DNA, microorganism, and biological toxin usage."
      a :text
    
    q_51 "Appendix D: Laboratory Specific SOPs</ br>
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
     #end
   end #end section
   # 
   # good
   section "RECOMBINANT DNA (rDNA)" do
      q_class2 "Mark the appropriate section(s) that describes this project. If experiment does not fall into any of these categories, contact Biosafety Office for assistance (check all that apply):", :pick => :any
        a_1 "III A....must receive approval from IBC and NIH Director before initiation of experiments."
        a_2 "III B….must receive approval from NIH/OBA and IBC before initiation of experiments."
        a_3 "III C.....must receive approval from IBC, IRB, and RAC review before research participant enrollment."
        a_4 "III D....must receive approval from IBC before initiation of experiments."
        a_5 "rDNA Involving Whole Animal"
        a_6 "rDNA Involving Whole Plants:"
        a_7 " III E….must notify IBC simultaneously upon initiation of research."
        a_8 "III F......exempt from IBC Review. To request an official exemption letter email lindstrom@montana.edu"
        
      label "Section III-A-1-a: The deliberate transfer of a drug resistance trait to microorganisms that are not known to acquire 
      the trait naturally if such acquisition could compromise the use of the drug to control disease agents in humans, 
      veterinary medicine, or agriculture. (Note that antibiotic resistance markers used for selecting and propagating plasmids in E. coli are not included.)"
        dependency :rule=>"Z"
        condition_Z :q_class2, "==", :a_1    
      
      label "Section III-B-1: Experiments involving the cloning of toxin molecules with LD50 of <100ng per kg body weight (e.g., 
        microbial toxins such as botulinum toxin, tetanus toxin)."
        dependency :rule=>"Z1"
        condition_Z1 :q_class2, "==", :a_2    
      
      label "Section III-C-1: Experiments involving the deliberate transfer of rDNA, or DNA or RNA derived from rDNA, into one or more human research participants."
        dependency :rule=>"Z2"
        condition_Z2 :q_class2, "==", :a_3
      
      label "< NOTE: Attach response to Points to Consider: Appendix M of the NIH Guidelines and submit any  
      supplemental documents such as investigator brochure, clinical study, correspondence with NIH, etc. "
      
      label "For rDNA experiments falling under Sections III-D-5-a through III-D-5-d, physical containment requirements may be reduced to the next lower level by appropriate biological containment practices, 
      such as conducting experiments on a virus with an obligate insect vector in the absence of that vector or using a genetically attenuated strain."
        dependency :rule=>"Z3"
        condition_Z3 :q_class2, "==", :a_6
      
      group "III-D" do
        dependency :rule=>"Z4"
        condition_Z4 :q_class2, "==", :a_4  
        
        q_class22 "III-D-1-a", :pick => :any
          a_1 "Introduction of rDNA into Risk Group 2 (RG-2) agents."
        
        q_class23 "III-D-1-b", :pick => :any
          a_1 "Introduction of rDNA into Risk Group 3 (RG-3) agents."
        
        q_class24 "III-D-2-a", :pick => :any
          a_1 "Experiments in which DNA from RG- 2, RG- 3 agents, or RG-4 agents is transferred into nonpathogenic prokaryotes or lower eukaryotes."
        
        q_class25 "III-D-3-a", :pick => :any
          a_1 "Use of infectious or defective RG-2 viruses in the presence of helper virus."
        
        q_class26 "III-D-3-b", :pick => :any
          a_1 "Use of infectious or defective RG-3 viruses in the presence of helper virus may be conducted at BL3 containment."
        
        q_class27 "III-D-3-d", :pick => :any
          a_1 "Use of infectious or defective restricted poxviruses in the presence of helper virus shall be determined on a case-by-case 
        basis following NIH/OBA review. A USDA permit is required for work with plant or animal pathogens."
        
        q_class28 "III-D-3-e", :pick => :any
          a_1 "Use of infectious or defective viruses in the presence of helper virus not covered in Sections III-D-3-a through III-D-3-d."
      end
      #good
      # 
      group "rDNA" do
        dependency :rule=>"Z6"
        condition_Z6 :q_class2, "==", :a_5
        
        q_class2v9 "III-D-4-a", :pick => :any
          a_1 "rDNA, or DNA or RNA molecules derived therefrom, from any source except for greater than two-thirds of eukaryotic viral genome may be transferred to any non-human vertebrate or any invertebrate organism and propagated under conditions of physical containment comparable to BSL1 or BSL1-N and appropriate to the organism under study. Animals that contain sequences from viral vectors, which do not lead to transmissible infection either directly or indirectly as a result of complementation or recombination in animals, may be propagated under conditions of physical containment comparable to BSL1 or BSL1-N and appropriate to the organism under study. Experiments involving the introduction of other sequences from eukaryotic viral genomes into
         animals are covered under Section III-D-4-b. Investigator must demonstrate that the fraction of the viral genome being utilized does not lead to productive infection."
        
        q_cwlass30 "III-D-4-b", :pick => :any
          a_1 "Experiments involving rDNA, or DNA or RNA derived therefrom, involving whole animals, including transgenic animals, and not covered by 
        Sections III-D-1 or III-D-4-a, may be conducted at the appropriate containment determined by the IBC."
        
        q_clas2s3c1"III-D-4-c-1", :pick => :any
          a_1 "Experiments involving the generation of transgenic rodents that require BSL1 containment."
        
        q_class3c"III-D-4-c-2", :pick => :any
          a_1 "Purchase or transfer of transgenic rodents is exempt from the 'NIH Guidelines', but register with the IBC (Form 4)."

      end
      group "rDNA" do
        dependency :rule=>"Z7"
        condition_Z7 :q_class2, "==", :a_6
        
        q_class29 "III-D-5-a", :pick => :any
          a_1 "BSL3-P (Plants) or BSL2-P + biological containment is recommended for experiments of most exotic infectious agents with recognized potential 
        for serious detrimental impact on managed or natural ecosystems when rDNA techniques are associated with whole plants."
        
        q_class30 "III-D-5-b", :pick => :any
          a_1 "BSL3-P or BSL2-P + biological containment is recommended for experiments involving plants containing cloned genomes of readily transmissible exotic infectious agents with recognized potential for serious detrimental effects on managed or natural ecosystems in 
        which there exists the possibility of reconstituting the complete and functional genome of the infectious agent by genomic complementation in planta."
        
        q_class3c1" III-D-5-c", :pick => :any
          a_1 "BSL4-P containment is recommended for experiments with a small number of readily transmissible exotic infectious agents, such as the soybean rust fungus (Phakospora pachyrhizi) and maize streak or other viruses in the presence of
         their specific arthropod vectors that have the potential of being serious pathogens of major U.S. crops."
        
        q_class3c2 "III-D-5-d ", :pick => :any
          a_1 "BSL3-P containment is recommended for experiments involving sequences encoding potent vertebrate toxins introduced into plants or associated organisms (also refer to Section III-B-1)."
        
        q_class3c3 "III-D-5-e", :pick => :any
          a_1 "BSL3-P or BSL2-P + biological containment is recommended for experiments with microbial pathogens of insects or small animals associated with plants if the 
        rDNA-modified organism has a recognized potential for serious detrimental impact on managed or natural ecosystems."
        
          q_class3c4 "III-D-6", :pick => :any
        a_1 "Experiments involving more than 10 liters of culture. The appropriate containment will be decided by the IBC."

      end
      #good
      group " III E" do
        dependency :rule=>"Z8"
        condition_Z8 :q_class2, "==", :a_7
        
        q_class29tr "III-E-1", :pick => :any
          a_1 "Experiments involving the formation of rDNA molecules containing  no more than 2/3 of the genome of any eukaryotic virus
         (All viruses from a single Family being considered identical.) may be propagated and maintained in cells in tissue culture using BSL1."
        
        q_class3043 "III-E-2-a ", :pick => :any
          a_1 "BSL1-P is recommended for all experiments with rDNA-containing plants and plant-associated microorganisms not covered in Section III-E-2-b or other sections of the NIH Guidelines. Examples of such experiments are those involving rDNA-modified plants that are not noxious weeds or that cannot interbreed with noxious weeds in the immediate geographic area, and experiments involving whole plants and rDNA-modified non-exotic microorganisms that have no recognized potential for rapid and widespread dissemination or for 
        serious detrimental impact on managed or natural ecosystems (e.g., Rhizobium spp. and Agrobacterium spp.). Use FORM 3 Registration of rDNA modified Whole Plants."
        
        q_class3c10"III-E-2-b", :pick => :any
          a_1 "BSL2-P or BSL1-P + biological containment is recommended for the following experiments:"
        
        q_class3c11"III-E-2-b-(1)", :pick => :any
          a_1 "Plants modified by rDNA that are noxious weeds or can interbreed with noxious weeds in the immediate geographic area."
        
        q_class3c12 "III-E-2-b-(2)", :pick => :any
          a_1 "Plants in which the introduced DNA represents the complete genome of a non-exotic infectious agent."
        
        q_clas1s3c13 "III-E-2-b-(3)", :pick => :any
          a_1 "Plants associated with rDNA-modified non-exotic microorganisms that have a recognized potential for serious detrimental impact on managed or natural ecosystems."
        
        q_class3c14 "III-E-2-b-(4)", :pick => :any
          a_1 "Plants associated with rDNA-modified exotic microorganisms that have no recognized potential for serious detrimental impact on managed or natural ecosystems."
        
        q_class3c15 "III-E-2-b-(5)", :pick => :any
          a_1 "Experiments with rDNA-modified arthropods or small animals associated with plants, or with arthropods or small animals with rDNA-modified microorganisms associated with them if the
         rDNA-modified microorganisms have no recognized potential for serious detrimental impact on managed or natural ecosystems."
        
        q_class3c1e "II-E-3", :pick => :any
          a_1 "Experiments involving the generation of rodents in which the animal’s genome has been altered by stable introduction of rDNA, or DNA derived therefrom, into 
        the germ0line (transgenic rodents). Use FORM 4 Registration of Transgenic Animals."
      end
      
      group "rDNA" do
        dependency :rule=>"Z"
        condition_Z :q_class2, "==", :a_8
        
        q_class291 "III-F-1", :pick => :any
          a_1 "rDNA molecules that are not in organisms or viruses."
        
        q_class302 "III-F-2", :pick => :any
          a_1 "rDNA molecules that consist entirely of DNA segments from a single nonchromosomal or viral DNA source, though one or more of the segments may be a synthetic equivalent."
        
        q_class3c13"III-F-3", :pick => :any
          a_1 "rDNA molecules that consist entirely of DNA from a prokaryotic host including its indigenous plasmids or viruses when propagated only in that
         host (or a closely related strain of the same species), or when transferred to another host by well established physiological means."
        
        q_class3c24 "III-F-4", :pick => :any
          a_1 "rDNA molecules that consist entirely of DNA from a eukaryotic host including its chloroplasts, mitochondria, or plasmids (but excluding viruses) when propagated only in that host (or closely related strain of the same species)."
        
        q_class3c35 "III-F-5", :pick => :any
          a_1 "rDNA molecules that consist entirely of DNA segments from different species that exchange DNA by known physiological processes, though one or more of the segments may be a synthetic equivalent."
        
        q_class3c46 "III-F-6", :pick => :any
          a_1 "rDNA experiments that do not present a significant risk to health or the environment as determined by the NIH Director, RAC and  following appropriate notice and opportunity for public comment. "

      end#edn group
  end #end section
end
