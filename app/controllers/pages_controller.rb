class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @properties = Property.all
  end

  def faqs
  end

  def services
    @plans = {
      basic: [
        {
          title: "1-1 Support",
          content: "Personalized, one-on-one assistance throughout the akiya purchasing process, ensuring all your questions and concerns are addressed."
        },
        {
          title: "Market Research Reports",
          content: "Detailed analysis of the akiya market, providing insights on trends, property values, and investment opportunities to inform your decisions."
        },
        {
          title: "Akiya Portfolio Curation (10 listings)",
          content: "Curated selection of 6 akiya properties tailored to your preferences, helping you find the best options available in the market."
        }
      ],
      standard: [
        {
          title: "Virtual Viewing",
          content: "Comprehensive virtual tours of selected properties (up to three), facilitating smooth communication with local agents and providing detailed property insights."
        },
        {
          title: "In-Person/On-Site Viewing",
          content: "Coordination of thorough on-site property tours (up to three) with local agents, ensuring you get an in-depth understanding of potential purchases."
        },
        {
          title: "Property Due Diligence / Reconnaissance",
          content: "Extensive property analysis, including reviewing existing documentation, locating missing reports, and assessing hazard maps."
        },
        {
          title: "Tax and Legal Consultancy",
          content: "Expert advice on tax implications and legal complexities unique to purchasing, renovating, and selling akiyas in Japan."
        },
        {
          title: "Travel and Local Logistics Support",
          content: "Assistance with travel arrangements, accommodations, and local transportation logistics for property visits and relocation."
        },
        {
          title: " Buyer Representation",
          content: "Professional advocacy and negotiation on your behalf, ensuring your interests are well-represented throughout the purchasing process."
        },
        {
          title: " Financing Advisory",
          content: "Guidance on financing options, helping you secure loans and navigate financial aspects of purchasing an akiya property."
        },
        {
          title: " Incentive Programs Information",
          content: "Information and guidance on government and local incentive programs, grants, and subsidies available for akiya purchases and renovations."
        }
      ],
      premium: [
        {
          title: "Introduction to Local Tradespeople",
          content: "Access to a network of trusted local contractors, electricians, plumbers, and tradespeople for renovation and maintenance work on your akiya."
        },
        {
          title: " Architectural and Design Services",
          content: "Collaboration with architects and designers to create customized renovation plans that respect the original structure while updating it to modern standards."
        },
        {
          title: "Sustainable Renovation Advice",
          content: "Expert advice on eco-friendly renovation practices, including the use of green materials and energy-efficient systems for your akiya."
        },
        {
          title: "Relocation Assistance",
          content: "Comprehensive relocation support, including moving services, temporary housing arrangements, and local area orientation for a smooth transition."
        },
        {
          title: "Community Integration Services",
          content: "Assistance in understanding the local community, including introductions to neighbors, local amenities, and cultural or social events."
        },
        {
          title: "Property Management for Non-Resident Owners",
          content: "Property management services to maintain and secure your akiya, ensuring it remains in good condition even if you are not residing there."
        }

      ]
    }
  end

end
