// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Environment: Codeunit "Environment Information";
        Tenant: Codeunit "Tenant Information";
        Tenant2: Codeunit "Azure AD Tenant";
    begin
        Message('%1 %2 %3 %4 %5 %6', Environment.IsFinancials(), Environment.IsOnPrem(), Environment.IsProduction(), Environment.IsSaaS(), Environment.IsSaaSInfrastructure(), Environment.IsSandbox());
        Message('%1 %2', Tenant.GetTenantDisplayName(), Tenant.GetTenantId());
        message('%1 %2', Tenant2.GetAadTenantDomainName(), Tenant2.GetAadTenantId());
    end;
}