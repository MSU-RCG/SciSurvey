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
    section "NIH GUIDELINES ASSESSMENT FOR RESEARCH INVOLVING RECOMBINANT DNA (rDNA)" do
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
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_2    
    label "Section III-C-1: Experiments involving the deliberate transfer of rDNA, or DNA or RNA derived from rDNA, into one or more human research participants."
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_3
    label "< NOTE: Attach response to Points to Consider: Appendix M of the NIH Guidelines and submit any  
    supplemental documents such as investigator brochure, clinical study, correspondence with NIH, etc. "
    label "For rDNA experiments falling under Sections III-D-5-a through III-D-5-d, physical containment requirements may be reduced to the next lower level by appropriate biological containment practices, 
    such as conducting experiments on a virus with an obligate insect vector in the absence of that vector or using a genetically attenuated strain."
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_6
    group "III-D" do
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_4  
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
  group "rDNA" do
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_5
    q_class2v9 "III-D-4-a", :pick => :any
    a_1 "rDNA, or DNA or RNA molecules derived therefrom, from any source except for greater than two-thirds of eukaryotic viral genome may be transferred to any non-human vertebrate or any invertebrate organism and propagated under conditions of physical containment comparable to BSL1 or BSL1-N and appropriate to the organism under study. Animals that contain sequences from viral vectors, which do not lead to transmissible infection either directly or indirectly as a result of complementation or recombination in animals, may be propagated under conditions of physical containment comparable to BSL1 or BSL1-N and appropriate to the organism under study. Experiments involving the introduction of other sequences from eukaryotic viral genomes into
     animals are covered under Section III-D-4-b. Investigator must demonstrate that the fraction of the viral genome being utilized does not lead to productive infection."
    q_cwlass30 "III-D-4-b", :pick => :any
    a_1 "Experiments involving rDNA, or DNA or RNA derived therefrom, involving whole animals, including transgenic animals, and not covered by 
    Sections III-D-1 or III-D-4-a, may be conducted at the appropriate containment determined by the IBC."
    q_clas2s3c1"III-D-4-c-1", :pick => :any
    a_1 "Experiments involving the generation of transgenic rodents that require BSL1 containment."
    q_class3c"III-D-4-c-2", :pick => :any
    a_1 "Purchase or transfer of transgenic rodents is exempt from the “NIH Guidelines”, but register with the IBC (Form 4)."

  end
  group "rDNA" do
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_6
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
group " III E" do
    dependency :rule=>"Z"
    condition_Z :q_class2, "==", :a_7
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

  end

    end
end

