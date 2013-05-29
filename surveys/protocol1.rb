# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.
survey "Protocol 1", :default_mandatory => false do

  section "Protocol Type" do
    
    # When :pick isn't specified, the default is :none (no checkbox or radio button)
    q_principle_investigator "Principle Investigator"
    a_1 :string
    
    q_projet_title "Project Title"
    a_1 :string

    # A basic question with checkboxes
    # The "question" and "answer" methods may be abbreviated as "q" and "a".
    # Append a reference identifier (a short string used for dependencies and validations) using the "_" underscore.
    # Question reference identifiers must be unique within a survey.
    # Answer reference identifiers must be unique within a question
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
    
    q "Required Biosaftey Level", :pick => :one, :display_type => :dropdown
    ["Exempt","BSL1", "BSL2", "BSL3"].each{ |level| a level}
    
    q_funding_agency "Funding Agency:"
    a_1 :string
    
    
    repeater "Personnel Conducting Experiments" do
      q "Person"
      a "First Name", :string
      a "Last Name", :string
      a "Responsabilities", :text
      a "Training Experience", :text
      
    end
    
    
  

  end
end
