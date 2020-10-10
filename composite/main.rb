require_relative 'company'

def company_name_from_tree(company)
    p "name: #{company.name}"

    return if company.children.nil?

    for company in company.children
        company_name_from_tree(company)
    end
end

company = Company.new(
    name: 'XXX',
    children: [],
    parent: nil
    )

company_b =  Company.new(
    name: 'YYY',
    children: nil,
    parent: company
    )

company_c =  Company.new(
    name: 'ZZZ',
    children: [],
    parent: company
    )

company_d =  Company.new(
    name: 'XYZ',
    children: nil,
    parent: company_c
    )

company.children << company_b
company.children << company_c
company_c.children <<  company_d

company_name_from_tree(company)
