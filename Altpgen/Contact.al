table 50101 "CDS Contact"
{
    ExternalName = 'contact';
    TableType = CDS;
    Description = 'Person with whom a business unit has a relationship, such as customer, supplier, and colleague.';

    fields
    {
        field(1; ContactId; GUID)
        {
            ExternalName = 'contactid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Unique identifier of the contact.';
            Caption = 'Contact';
        }
        field(3; CustomerSizeCode; Option)
        {
            ExternalName = 'customersizecode';
            ExternalType = 'Picklist';
            Description = 'Select the size of the contact''s company for segmentation and reporting purposes.';
            Caption = 'Customer Size';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(4; CustomerTypeCode; Option)
        {
            ExternalName = 'customertypecode';
            ExternalType = 'Picklist';
            Description = 'Select the category that best describes the relationship between the contact and your organization.';
            Caption = 'Relationship Type';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(5; PreferredContactMethodCode; Option)
        {
            ExternalName = 'preferredcontactmethodcode';
            ExternalType = 'Picklist';
            Description = 'Select the preferred method of contact.';
            Caption = 'Preferred Method of Contact';
            InitValue = Any;
            OptionMembers = Any,Email,Phone,Fax,Mail;
            OptionOrdinalValues = 1, 2, 3, 4, 5;
        }
        field(6; LeadSourceCode; Option)
        {
            ExternalName = 'leadsourcecode';
            ExternalType = 'Picklist';
            Description = 'Select the primary marketing source that directed the contact to your organization.';
            Caption = 'Lead Source';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(9; OwningBusinessUnit; GUID)
        {
            ExternalName = 'owningbusinessunit';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Unique identifier of the business unit that owns the contact.';
            Caption = 'Owning Business Unit';
            TableRelation = "CDS BusinessUnit".BusinessUnitId;
        }
        field(10; OwningUser; GUID)
        {
            ExternalName = 'owninguser';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Unique identifier of the user who owns the contact.';
            Caption = 'Owning User';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(11; PaymentTermsCode; Option)
        {
            ExternalName = 'paymenttermscode';
            ExternalType = 'Picklist';
            Description = 'Select the payment terms to indicate when the customer needs to pay the total amount.';
            Caption = 'Payment Terms';
            InitValue = " ";
            OptionMembers = " ",Net30,"2%10Net30",Net45,Net60;
            OptionOrdinalValues = -1, 1, 2, 3, 4;
        }
        field(12; ShippingMethodCode; Option)
        {
            ExternalName = 'shippingmethodcode';
            ExternalType = 'Picklist';
            Description = 'Select a shipping method for deliveries sent to this address.';
            Caption = 'Shipping Method';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(14; AccountId; GUID)
        {
            ExternalName = 'accountid';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Unique identifier of the account with which the contact is associated.';
            Caption = 'Account';
            TableRelation = "CDS Account".AccountId;
        }
        field(15; ParticipatesInWorkflow; Boolean)
        {
            ExternalName = 'participatesinworkflow';
            ExternalType = 'Boolean';
            Description = 'Shows whether the contact participates in workflow rules.';
            Caption = 'Participates in Workflow';
        }
        field(16; IsBackofficeCustomer; Boolean)
        {
            ExternalName = 'isbackofficecustomer';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact exists in a separate accounting or other system, such as Microsoft Dynamics GP or another ERP database, for use in integration processes.';
            Caption = 'Back Office Customer';
        }
        field(17; Salutation; Text[100])
        {
            ExternalName = 'salutation';
            ExternalType = 'String';
            Description = 'Type the salutation of the contact to make sure the contact is addressed correctly in sales calls, email messages, and marketing campaigns.';
            Caption = 'Salutation';
        }
        field(18; JobTitle; Text[100])
        {
            ExternalName = 'jobtitle';
            ExternalType = 'String';
            Description = 'Type the job title of the contact to make sure the contact is addressed correctly in sales calls, email, and marketing campaigns.';
            Caption = 'Job Title';
        }
        field(19; FirstName; Text[50])
        {
            ExternalName = 'firstname';
            ExternalType = 'String';
            Description = 'Type the contact''s first name to make sure the contact is addressed correctly in sales calls, email, and marketing campaigns.';
            Caption = 'First Name';
        }
        field(20; Department; Text[100])
        {
            ExternalName = 'department';
            ExternalType = 'String';
            Description = 'Type the department or business unit where the contact works in the parent company or business.';
            Caption = 'Department';
        }
        field(21; NickName; Text[100])
        {
            ExternalName = 'nickname';
            ExternalType = 'String';
            Description = 'Type the contact''s nickname.';
            Caption = 'Nickname';
        }
        field(22; MiddleName; Text[50])
        {
            ExternalName = 'middlename';
            ExternalType = 'String';
            Description = 'Type the contact''s middle name or initial to make sure the contact is addressed correctly.';
            Caption = 'Middle Name';
        }
        field(23; LastName; Text[50])
        {
            ExternalName = 'lastname';
            ExternalType = 'String';
            Description = 'Type the contact''s last name to make sure the contact is addressed correctly in sales calls, email, and marketing campaigns.';
            Caption = 'Last Name';
        }
        field(24; Suffix; Text[10])
        {
            ExternalName = 'suffix';
            ExternalType = 'String';
            Description = 'Type the suffix used in the contact''s name, such as Jr. or Sr. to make sure the contact is addressed correctly in sales calls, email, and marketing campaigns.';
            Caption = 'Suffix';
        }
        field(25; YomiFirstName; Text[150])
        {
            ExternalName = 'yomifirstname';
            ExternalType = 'String';
            Description = 'Type the phonetic spelling of the contact''s first name, if the name is specified in Japanese, to make sure the name is pronounced correctly in phone calls with the contact.';
            Caption = 'Yomi First Name';
        }
        field(26; FullName; Text[160])
        {
            ExternalName = 'fullname';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = 'Combines and shows the contact''s first and last names so that the full name can be displayed in views and reports.';
            Caption = 'Full Name';
        }
        field(27; YomiMiddleName; Text[150])
        {
            ExternalName = 'yomimiddlename';
            ExternalType = 'String';
            Description = 'Type the phonetic spelling of the contact''s middle name, if the name is specified in Japanese, to make sure the name is pronounced correctly in phone calls with the contact.';
            Caption = 'Yomi Middle Name';
        }
        field(28; YomiLastName; Text[150])
        {
            ExternalName = 'yomilastname';
            ExternalType = 'String';
            Description = 'Type the phonetic spelling of the contact''s last name, if the name is specified in Japanese, to make sure the name is pronounced correctly in phone calls with the contact.';
            Caption = 'Yomi Last Name';
        }
        field(29; Anniversary; Date)
        {
            ExternalName = 'anniversary';
            ExternalType = 'DateTime';
            Description = 'Enter the date of the contact''s wedding or service anniversary for use in customer gift programs or other communications.';
            Caption = 'Anniversary';
        }
        field(30; BirthDate; Date)
        {
            ExternalName = 'birthdate';
            ExternalType = 'DateTime';
            Description = 'Enter the contact''s birthday for use in customer gift programs or other communications.';
            Caption = 'Birthday';
        }
        field(31; GovernmentId; Text[50])
        {
            ExternalName = 'governmentid';
            ExternalType = 'String';
            Description = 'Type the passport number or other government ID for the contact for use in documents or reports.';
            Caption = 'Government';
        }
        field(32; YomiFullName; Text[450])
        {
            ExternalName = 'yomifullname';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = 'Shows the combined Yomi first and last names of the contact so that the full phonetic name can be displayed in views and reports.';
            Caption = 'Yomi Full Name';
        }
        field(33; Description; BLOB)
        {
            ExternalName = 'description';
            ExternalType = 'Memo';
            Description = 'Type additional information to describe the contact, such as an excerpt from the company''s website.';
            Caption = 'Description';
            Subtype = Memo;
        }
        field(34; EmployeeId; Text[50])
        {
            ExternalName = 'employeeid';
            ExternalType = 'String';
            Description = 'Type the employee ID or number for the contact for reference in orders, service cases, or other communications with the contact''s organization.';
            Caption = 'Employee';
        }
        field(35; GenderCode; Option)
        {
            ExternalName = 'gendercode';
            ExternalType = 'Picklist';
            Description = 'Select the contact''s gender to make sure the contact is addressed correctly in sales calls, email, and marketing campaigns.';
            Caption = 'Gender';
            InitValue = " ";
            OptionMembers = " ",Male,Female;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(36; AnnualIncome; Decimal)
        {
            ExternalName = 'annualincome';
            ExternalType = 'Money';
            Description = 'Type the contact''s annual income for use in profiling and financial analysis.';
            Caption = 'Annual Income';
        }
        field(37; HasChildrenCode; Option)
        {
            ExternalName = 'haschildrencode';
            ExternalType = 'Picklist';
            Description = 'Select whether the contact has any children for reference in follow-up phone calls and other communications.';
            Caption = 'Has Children';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(38; EducationCode; Option)
        {
            ExternalName = 'educationcode';
            ExternalType = 'Picklist';
            Description = 'Select the contact''s highest level of education for use in segmentation and analysis.';
            Caption = 'Education';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(39; WebSiteUrl; Text[200])
        {
            ExternalName = 'websiteurl';
            ExternalType = 'String';
            Description = 'Type the contact''s professional or personal website or blog URL.';
            Caption = 'Website';
        }
        field(40; FamilyStatusCode; Option)
        {
            ExternalName = 'familystatuscode';
            ExternalType = 'Picklist';
            Description = 'Select the marital status of the contact for reference in follow-up phone calls and other communications.';
            Caption = 'Marital Status';
            InitValue = " ";
            OptionMembers = " ",Single,Married,Divorced,Widowed;
            OptionOrdinalValues = -1, 1, 2, 3, 4;
        }
        field(41; FtpSiteUrl; Text[200])
        {
            ExternalName = 'ftpsiteurl';
            ExternalType = 'String';
            Description = 'Type the URL for the contact''s FTP site to enable users to access data and share documents.';
            Caption = 'FTP Site';
        }
        field(42; EMailAddress1; Text[100])
        {
            ExternalName = 'emailaddress1';
            ExternalType = 'String';
            Description = 'Type the primary email address for the contact.';
            Caption = 'Email';
        }
        field(43; SpousesName; Text[100])
        {
            ExternalName = 'spousesname';
            ExternalType = 'String';
            Description = 'Type the name of the contact''s spouse or partner for reference during calls, events, or other communications with the contact.';
            Caption = 'Spouse/Partner Name';
        }
        field(44; AssistantName; Text[100])
        {
            ExternalName = 'assistantname';
            ExternalType = 'String';
            Description = 'Type the name of the contact''s assistant.';
            Caption = 'Assistant';
        }
        field(45; EMailAddress2; Text[100])
        {
            ExternalName = 'emailaddress2';
            ExternalType = 'String';
            Description = 'Type the secondary email address for the contact.';
            Caption = 'Email Address 2';
        }
        field(46; AssistantPhone; Text[50])
        {
            ExternalName = 'assistantphone';
            ExternalType = 'String';
            Description = 'Type the phone number for the contact''s assistant.';
            Caption = 'Assistant Phone';
        }
        field(47; EMailAddress3; Text[100])
        {
            ExternalName = 'emailaddress3';
            ExternalType = 'String';
            Description = 'Type an alternate email address for the contact.';
            Caption = 'Email Address 3';
        }
        field(48; DoNotPhone; Boolean)
        {
            ExternalName = 'donotphone';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact accepts phone calls. If Do Not Allow is selected, the contact will be excluded from any phone call activities distributed in marketing campaigns.';
            Caption = 'Do not allow Phone Calls';
        }
        field(49; ManagerName; Text[100])
        {
            ExternalName = 'managername';
            ExternalType = 'String';
            Description = 'Type the name of the contact''s manager for use in escalating issues or other follow-up communications with the contact.';
            Caption = 'Manager';
        }
        field(50; ManagerPhone; Text[50])
        {
            ExternalName = 'managerphone';
            ExternalType = 'String';
            Description = 'Type the phone number for the contact''s manager.';
            Caption = 'Manager Phone';
        }
        field(51; DoNotFax; Boolean)
        {
            ExternalName = 'donotfax';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact allows faxes. If Do Not Allow is selected, the contact will be excluded from any fax activities distributed in marketing campaigns.';
            Caption = 'Do not allow Faxes';
        }
        field(52; DoNotEMail; Boolean)
        {
            ExternalName = 'donotemail';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact allows direct email sent from Microsoft Dynamics 365. If Do Not Allow is selected, Microsoft Dynamics 365 will not send the email.';
            Caption = 'Do not allow Emails';
        }
        field(53; DoNotPostalMail; Boolean)
        {
            ExternalName = 'donotpostalmail';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact allows direct mail. If Do Not Allow is selected, the contact will be excluded from letter activities distributed in marketing campaigns.';
            Caption = 'Do not allow Mails';
        }
        field(54; DoNotBulkEMail; Boolean)
        {
            ExternalName = 'donotbulkemail';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact accepts bulk email sent through marketing campaigns or quick campaigns. If Do Not Allow is selected, the contact can be added to marketing lists, but will be excluded from the email.';
            Caption = 'Do not allow Bulk Emails';
        }
        field(55; DoNotBulkPostalMail; Boolean)
        {
            ExternalName = 'donotbulkpostalmail';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact accepts bulk postal mail sent through marketing campaigns or quick campaigns. If Do Not Allow is selected, the contact can be added to marketing lists, but will be excluded from the letters.';
            Caption = 'Do not allow Bulk Mails';
        }
        field(56; AccountRoleCode; Option)
        {
            ExternalName = 'accountrolecode';
            ExternalType = 'Picklist';
            Description = 'Select the contact''s role within the company or sales process, such as decision maker, employee, or influencer.';
            Caption = 'Role';
            InitValue = " ";
            OptionMembers = " ",DecisionMaker,Employee,Influencer;
            OptionOrdinalValues = -1, 1, 2, 3;
        }
        field(57; TerritoryCode; Option)
        {
            ExternalName = 'territorycode';
            ExternalType = 'Picklist';
            Description = 'Select a region or territory for the contact for use in segmentation and analysis.';
            Caption = 'Territory';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(59; CreditLimit; Decimal)
        {
            ExternalName = 'creditlimit';
            ExternalType = 'Money';
            Description = 'Type the credit limit of the contact for reference when you address invoice and accounting issues with the customer.';
            Caption = 'Credit Limit';
        }
        field(60; CreatedOn; Datetime)
        {
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Shows the date and time when the record was created. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            Caption = 'Created On';
        }
        field(61; CreditOnHold; Boolean)
        {
            ExternalName = 'creditonhold';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact is on a credit hold, for reference when addressing invoice and accounting issues.';
            Caption = 'Credit Hold';
        }
        field(62; CreatedBy; GUID)
        {
            ExternalName = 'createdby';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Shows who created the record.';
            Caption = 'Created By';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(63; ModifiedOn; Datetime)
        {
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Shows the date and time when the record was last updated. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            Caption = 'Modified On';
        }
        field(64; ModifiedBy; GUID)
        {
            ExternalName = 'modifiedby';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Shows who last updated the record.';
            Caption = 'Modified By';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(66; NumberOfChildren; Integer)
        {
            ExternalName = 'numberofchildren';
            ExternalType = 'Integer';
            Description = 'Type the number of children the contact has for reference in follow-up phone calls and other communications.';
            Caption = 'No. of Children';
        }
        field(67; ChildrensNames; Text[255])
        {
            ExternalName = 'childrensnames';
            ExternalType = 'String';
            Description = 'Type the names of the contact''s children for reference in communications and client programs.';
            Caption = 'Children''s Names';
        }
        field(68; VersionNumber; BigInteger)
        {
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version number of the contact.';
            Caption = 'Version Number';
        }
        field(69; MobilePhone; Text[50])
        {
            ExternalName = 'mobilephone';
            ExternalType = 'String';
            Description = 'Type the mobile phone number for the contact.';
            Caption = 'Mobile Phone';
        }
        field(70; Pager; Text[50])
        {
            ExternalName = 'pager';
            ExternalType = 'String';
            Description = 'Type the pager number for the contact.';
            Caption = 'Pager';
        }
        field(71; Telephone1; Text[50])
        {
            ExternalName = 'telephone1';
            ExternalType = 'String';
            Description = 'Type the main phone number for this contact.';
            Caption = 'Business Phone';
        }
        field(72; Telephone2; Text[50])
        {
            ExternalName = 'telephone2';
            ExternalType = 'String';
            Description = 'Type a second phone number for this contact.';
            Caption = 'Home Phone';
        }
        field(73; Telephone3; Text[50])
        {
            ExternalName = 'telephone3';
            ExternalType = 'String';
            Description = 'Type a third phone number for this contact.';
            Caption = 'Telephone 3';
        }
        field(74; Fax; Text[50])
        {
            ExternalName = 'fax';
            ExternalType = 'String';
            Description = 'Type the fax number for the contact.';
            Caption = 'Fax';
        }
        field(75; Aging30; Decimal)
        {
            ExternalName = 'aging30';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'For system use only.';
            Caption = 'Aging 30';
        }
        field(76; StateCode; Option)
        {
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Shows whether the contact is active or inactive. Inactive contacts are read-only and can''t be edited unless they are reactivated.';
            Caption = 'Status';
            InitValue = Active;
            OptionMembers = Active,Inactive;
            OptionOrdinalValues = 0, 1;
        }
        field(77; Aging60; Decimal)
        {
            ExternalName = 'aging60';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'For system use only.';
            Caption = 'Aging 60';
        }
        field(78; StatusCode; Option)
        {
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Select the contact''s status.';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(79; Aging90; Decimal)
        {
            ExternalName = 'aging90';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'For system use only.';
            Caption = 'Aging 90';
        }
        field(80; ParentContactId; GUID)
        {
            ExternalName = 'parentcontactid';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Unique identifier of the parent contact.';
            Caption = 'Parent Contact';
            TableRelation = "CDS Contact".ContactId;
        }
        field(83; ParentContactIdName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS Contact".FullName where(ContactId = field(ParentContactId)));
            ExternalName = 'parentcontactidname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(85; AccountIdName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS Account".Name where(AccountId = field(AccountId)));
            ExternalName = 'accountidname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(89; Address1_AddressId; GUID)
        {
            ExternalName = 'address1_addressid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Unique identifier for address 1.';
            Caption = 'Address 1: ID';
        }
        field(90; Address1_AddressTypeCode; Option)
        {
            ExternalName = 'address1_addresstypecode';
            ExternalType = 'Picklist';
            Description = 'Select the primary address type.';
            Caption = 'Address 1: Address Type';
            InitValue = " ";
            OptionMembers = " ",BillTo,ShipTo,Primary,Other;
            OptionOrdinalValues = -1, 1, 2, 3, 4;
        }
        field(91; Address1_Name; Text[200])
        {
            ExternalName = 'address1_name';
            ExternalType = 'String';
            Description = 'Type a descriptive name for the primary address, such as Corporate Headquarters.';
            Caption = 'Address 1: Name';
        }
        field(92; Address1_PrimaryContactName; Text[100])
        {
            ExternalName = 'address1_primarycontactname';
            ExternalType = 'String';
            Description = 'Type the name of the main contact at the account''s primary address.';
            Caption = 'Address 1: Primary Contact Name';
        }
        field(93; Address1_Line1; Text[250])
        {
            ExternalName = 'address1_line1';
            ExternalType = 'String';
            Description = 'Type the first line of the primary address.';
            Caption = 'Address 1: Street 1';
        }
        field(94; Address1_Line2; Text[250])
        {
            ExternalName = 'address1_line2';
            ExternalType = 'String';
            Description = 'Type the second line of the primary address.';
            Caption = 'Address 1: Street 2';
        }
        field(95; Address1_Line3; Text[250])
        {
            ExternalName = 'address1_line3';
            ExternalType = 'String';
            Description = 'Type the third line of the primary address.';
            Caption = 'Address 1: Street 3';
        }
        field(96; Address1_City; Text[80])
        {
            ExternalName = 'address1_city';
            ExternalType = 'String';
            Description = 'Type the city for the primary address.';
            Caption = 'Address 1: City';
        }
        field(97; Address1_StateOrProvince; Text[50])
        {
            ExternalName = 'address1_stateorprovince';
            ExternalType = 'String';
            Description = 'Type the state or province of the primary address.';
            Caption = 'Address 1: State/Province';
        }
        field(98; Address1_County; Text[50])
        {
            ExternalName = 'address1_county';
            ExternalType = 'String';
            Description = 'Type the county for the primary address.';
            Caption = 'Address 1: County';
        }
        field(99; Address1_Country; Text[80])
        {
            ExternalName = 'address1_country';
            ExternalType = 'String';
            Description = 'Type the country or region for the primary address.';
            Caption = 'Address 1: Country/Region';
        }
        field(100; Address1_PostOfficeBox; Text[20])
        {
            ExternalName = 'address1_postofficebox';
            ExternalType = 'String';
            Description = 'Type the post office box number of the primary address.';
            Caption = 'Address 1: Post Office Box';
        }
        field(101; Address1_PostalCode; Text[20])
        {
            ExternalName = 'address1_postalcode';
            ExternalType = 'String';
            Description = 'Type the ZIP Code or postal code for the primary address.';
            Caption = 'Address 1: ZIP/Postal Code';
        }
        field(102; Address1_UTCOffset; Integer)
        {
            ExternalName = 'address1_utcoffset';
            ExternalType = 'Integer';
            Description = 'Select the time zone, or UTC offset, for this address so that other people can reference it when they contact someone at this address.';
            Caption = 'Address 1: UTC Offset';
        }
        field(103; Address1_FreightTermsCode; Option)
        {
            ExternalName = 'address1_freighttermscode';
            ExternalType = 'Picklist';
            Description = 'Select the freight terms for the primary address to make sure shipping orders are processed correctly.';
            Caption = 'Address 1: Freight Terms';
            InitValue = " ";
            OptionMembers = " ",FOB,NoCharge;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(104; Address1_UPSZone; Text[4])
        {
            ExternalName = 'address1_upszone';
            ExternalType = 'String';
            Description = 'Type the UPS zone of the primary address to make sure shipping charges are calculated correctly and deliveries are made promptly, if shipped by UPS.';
            Caption = 'Address 1: UPS Zone';
        }
        field(105; Address1_Latitude; Decimal)
        {
            ExternalName = 'address1_latitude';
            ExternalType = 'Double';
            Description = 'Type the latitude value for the primary address for use in mapping and other applications.';
            Caption = 'Address 1: Latitude';
        }
        field(106; Address1_Telephone1; Text[50])
        {
            ExternalName = 'address1_telephone1';
            ExternalType = 'String';
            Description = 'Type the main phone number associated with the primary address.';
            Caption = 'Address 1: Phone';
        }
        field(107; Address1_Longitude; Decimal)
        {
            ExternalName = 'address1_longitude';
            ExternalType = 'Double';
            Description = 'Type the longitude value for the primary address for use in mapping and other applications.';
            Caption = 'Address 1: Longitude';
        }
        field(108; Address1_ShippingMethodCode; Option)
        {
            ExternalName = 'address1_shippingmethodcode';
            ExternalType = 'Picklist';
            Description = 'Select a shipping method for deliveries sent to this address.';
            Caption = 'Address 1: Shipping Method';
            InitValue = " ";
            OptionMembers = " ",Airborne,DHL,FedEx,UPS,PostalMail,FullLoad,WillCall;
            OptionOrdinalValues = -1, 1, 2, 3, 4, 5, 6, 7;
        }
        field(109; Address1_Telephone2; Text[50])
        {
            ExternalName = 'address1_telephone2';
            ExternalType = 'String';
            Description = 'Type a second phone number associated with the primary address.';
            Caption = 'Address 1: Telephone 2';
        }
        field(110; Address1_Telephone3; Text[50])
        {
            ExternalName = 'address1_telephone3';
            ExternalType = 'String';
            Description = 'Type a third phone number associated with the primary address.';
            Caption = 'Address 1: Telephone 3';
        }
        field(111; Address1_Fax; Text[50])
        {
            ExternalName = 'address1_fax';
            ExternalType = 'String';
            Description = 'Type the fax number associated with the primary address.';
            Caption = 'Address 1: Fax';
        }
        field(112; Address2_AddressId; GUID)
        {
            ExternalName = 'address2_addressid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Unique identifier for address 2.';
            Caption = 'Address 2: ID';
        }
        field(113; Address2_AddressTypeCode; Option)
        {
            ExternalName = 'address2_addresstypecode';
            ExternalType = 'Picklist';
            Description = 'Select the secondary address type.';
            Caption = 'Address 2: Address Type';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(114; Address2_Name; Text[100])
        {
            ExternalName = 'address2_name';
            ExternalType = 'String';
            Description = 'Type a descriptive name for the secondary address, such as Corporate Headquarters.';
            Caption = 'Address 2: Name';
        }
        field(115; Address2_PrimaryContactName; Text[100])
        {
            ExternalName = 'address2_primarycontactname';
            ExternalType = 'String';
            Description = 'Type the name of the main contact at the account''s secondary address.';
            Caption = 'Address 2: Primary Contact Name';
        }
        field(116; Address2_Line1; Text[250])
        {
            ExternalName = 'address2_line1';
            ExternalType = 'String';
            Description = 'Type the first line of the secondary address.';
            Caption = 'Address 2: Street 1';
        }
        field(117; Address2_Line2; Text[250])
        {
            ExternalName = 'address2_line2';
            ExternalType = 'String';
            Description = 'Type the second line of the secondary address.';
            Caption = 'Address 2: Street 2';
        }
        field(118; Address2_Line3; Text[250])
        {
            ExternalName = 'address2_line3';
            ExternalType = 'String';
            Description = 'Type the third line of the secondary address.';
            Caption = 'Address 2: Street 3';
        }
        field(119; Address2_City; Text[80])
        {
            ExternalName = 'address2_city';
            ExternalType = 'String';
            Description = 'Type the city for the secondary address.';
            Caption = 'Address 2: City';
        }
        field(120; Address2_StateOrProvince; Text[50])
        {
            ExternalName = 'address2_stateorprovince';
            ExternalType = 'String';
            Description = 'Type the state or province of the secondary address.';
            Caption = 'Address 2: State/Province';
        }
        field(121; Address2_County; Text[50])
        {
            ExternalName = 'address2_county';
            ExternalType = 'String';
            Description = 'Type the county for the secondary address.';
            Caption = 'Address 2: County';
        }
        field(122; Address2_Country; Text[80])
        {
            ExternalName = 'address2_country';
            ExternalType = 'String';
            Description = 'Type the country or region for the secondary address.';
            Caption = 'Address 2: Country/Region';
        }
        field(123; Address2_PostOfficeBox; Text[20])
        {
            ExternalName = 'address2_postofficebox';
            ExternalType = 'String';
            Description = 'Type the post office box number of the secondary address.';
            Caption = 'Address 2: Post Office Box';
        }
        field(124; Address2_PostalCode; Text[20])
        {
            ExternalName = 'address2_postalcode';
            ExternalType = 'String';
            Description = 'Type the ZIP Code or postal code for the secondary address.';
            Caption = 'Address 2: ZIP/Postal Code';
        }
        field(125; Address2_UTCOffset; Integer)
        {
            ExternalName = 'address2_utcoffset';
            ExternalType = 'Integer';
            Description = 'Select the time zone, or UTC offset, for this address so that other people can reference it when they contact someone at this address.';
            Caption = 'Address 2: UTC Offset';
        }
        field(126; Address2_FreightTermsCode; Option)
        {
            ExternalName = 'address2_freighttermscode';
            ExternalType = 'Picklist';
            Description = 'Select the freight terms for the secondary address to make sure shipping orders are processed correctly.';
            Caption = 'Address 2: Freight Terms';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(127; Address2_UPSZone; Text[4])
        {
            ExternalName = 'address2_upszone';
            ExternalType = 'String';
            Description = 'Type the UPS zone of the secondary address to make sure shipping charges are calculated correctly and deliveries are made promptly, if shipped by UPS.';
            Caption = 'Address 2: UPS Zone';
        }
        field(128; Address2_Latitude; Decimal)
        {
            ExternalName = 'address2_latitude';
            ExternalType = 'Double';
            Description = 'Type the latitude value for the secondary address for use in mapping and other applications.';
            Caption = 'Address 2: Latitude';
        }
        field(129; Address2_Telephone1; Text[50])
        {
            ExternalName = 'address2_telephone1';
            ExternalType = 'String';
            Description = 'Type the main phone number associated with the secondary address.';
            Caption = 'Address 2: Telephone 1';
        }
        field(130; Address2_Longitude; Decimal)
        {
            ExternalName = 'address2_longitude';
            ExternalType = 'Double';
            Description = 'Type the longitude value for the secondary address for use in mapping and other applications.';
            Caption = 'Address 2: Longitude';
        }
        field(131; Address2_ShippingMethodCode; Option)
        {
            ExternalName = 'address2_shippingmethodcode';
            ExternalType = 'Picklist';
            Description = 'Select a shipping method for deliveries sent to this address.';
            Caption = 'Address 2: Shipping Method';
            InitValue = DefaultValue;
            OptionMembers = DefaultValue;
            OptionOrdinalValues = 1;
        }
        field(132; Address2_Telephone2; Text[50])
        {
            ExternalName = 'address2_telephone2';
            ExternalType = 'String';
            Description = 'Type a second phone number associated with the secondary address.';
            Caption = 'Address 2: Telephone 2';
        }
        field(133; Address2_Telephone3; Text[50])
        {
            ExternalName = 'address2_telephone3';
            ExternalType = 'String';
            Description = 'Type a third phone number associated with the secondary address.';
            Caption = 'Address 2: Telephone 3';
        }
        field(134; Address2_Fax; Text[50])
        {
            ExternalName = 'address2_fax';
            ExternalType = 'String';
            Description = 'Type the fax number associated with the secondary address.';
            Caption = 'Address 2: Fax';
        }
        field(135; CreatedByName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId = field(CreatedBy)));
            ExternalName = 'createdbyname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(137; ModifiedByName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId = field(ModifiedBy)));
            ExternalName = 'modifiedbyname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(173; PreferredSystemUserId; GUID)
        {
            ExternalName = 'preferredsystemuserid';
            ExternalType = 'Lookup';
            Description = 'Choose the regular or preferred customer service representative for reference when scheduling service activities for the contact.';
            Caption = 'Preferred User';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(175; MasterId; GUID)
        {
            ExternalName = 'masterid';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Unique identifier of the master contact for merge.';
            Caption = 'Master ID';
            TableRelation = "CDS Contact".ContactId;
        }
        field(176; PreferredAppointmentDayCode; Option)
        {
            ExternalName = 'preferredappointmentdaycode';
            ExternalType = 'Picklist';
            Description = 'Select the preferred day of the week for service appointments.';
            Caption = 'Preferred Day';
            InitValue = " ";
            OptionMembers = " ",Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday;
            OptionOrdinalValues = -1, 0, 1, 2, 3, 4, 5, 6;
        }
        field(177; PreferredAppointmentTimeCode; Option)
        {
            ExternalName = 'preferredappointmenttimecode';
            ExternalType = 'Picklist';
            Description = 'Select the preferred time of day for service appointments.';
            Caption = 'Preferred Time';
            InitValue = Morning;
            OptionMembers = Morning,Afternoon,Evening;
            OptionOrdinalValues = 1, 2, 3;
        }
        field(178; DoNotSendMM; Boolean)
        {
            ExternalName = 'donotsendmm';
            ExternalType = 'Boolean';
            Description = 'Select whether the contact accepts marketing materials, such as brochures or catalogs. Contacts that opt out can be excluded from marketing initiatives.';
            Caption = 'Send Marketing Materials';
        }
        field(179; ParentCustomerId; GUID)
        {
            ExternalName = 'parentcustomerid';
            ExternalType = 'Customer';
            Description = 'Select the parent account or parent contact for the contact to provide a quick link to additional details, such as financial information, activities, and opportunities.';
            Caption = 'Company Name';
        }
        field(180; Merged; Boolean)
        {
            ExternalName = 'merged';
            ExternalType = 'Boolean';
            ExternalAccess = Read;
            Description = 'Shows whether the account has been merged with a master contact.';
            Caption = 'Merged';
        }
        field(181; ExternalUserIdentifier; Text[50])
        {
            ExternalName = 'externaluseridentifier';
            ExternalType = 'String';
            Description = 'Identifier for an external user.';
            Caption = 'External User Identifier';
        }
        field(184; LastUsedInCampaign; Date)
        {
            ExternalName = 'lastusedincampaign';
            ExternalType = 'DateTime';
            ExternalAccess = Modify;
            Description = 'Shows the date when the contact was last included in a marketing campaign or quick campaign.';
            Caption = 'Last Date Included in Campaign';
        }
        field(185; MasterContactIdName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS Contact".FullName where(ContactId = field(MasterId)));
            ExternalName = 'mastercontactidname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(186; PreferredSystemUserIdName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId = field(PreferredSystemUserId)));
            ExternalName = 'preferredsystemuseridname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(201; OverriddenCreatedOn; Date)
        {
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(202; ExchangeRate; Decimal)
        {
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
            ExternalAccess = Read;
            Description = 'Shows the conversion rate of the record''s currency. The exchange rate is used to convert all money fields in the record from the local currency to the system''s default currency.';
            Caption = 'Exchange Rate';
        }
        field(203; ImportSequenceNumber; Integer)
        {
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Unique identifier of the data import or data migration that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(204; TimeZoneRuleVersionNumber; Integer)
        {
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(205; UTCConversionTimeZoneCode; Integer)
        {
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(206; AnnualIncome_Base; Decimal)
        {
            ExternalName = 'annualincome_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the Annual Income field converted to the system''s default base currency. The calculations use the exchange rate specified in the Currencies area.';
            Caption = 'Annual Income (Base)';
        }
        field(208; CreditLimit_Base; Decimal)
        {
            ExternalName = 'creditlimit_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the Credit Limit field converted to the system''s default base currency for reporting purposes. The calculations use the exchange rate specified in the Currencies area.';
            Caption = 'Credit Limit (Base)';
        }
        field(209; Aging60_Base; Decimal)
        {
            ExternalName = 'aging60_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the Aging 60 field converted to the system''s default base currency. The calculations use the exchange rate specified in the Currencies area.';
            Caption = 'Aging 60 (Base)';
        }
        field(210; Aging90_Base; Decimal)
        {
            ExternalName = 'aging90_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the Aging 90 field converted to the system''s default base currency. The calculations use the exchange rate specified in the Currencies area.';
            Caption = 'Aging 90 (Base)';
        }
        field(211; Aging30_Base; Decimal)
        {
            ExternalName = 'aging30_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the Aging 30 field converted to the system''s default base currency. The calculations use the exchange rate specified in the Currencies area.';
            Caption = 'Aging 30 (Base)';
        }
        field(222; CreatedOnBehalfBy; GUID)
        {
            ExternalName = 'createdonbehalfby';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Shows who created the record on behalf of another user.';
            Caption = 'Created By (Delegate)';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(224; CreatedOnBehalfByName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId = field(CreatedOnBehalfBy)));
            ExternalName = 'createdonbehalfbyname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(226; ModifiedOnBehalfBy; GUID)
        {
            ExternalName = 'modifiedonbehalfby';
            ExternalType = 'Lookup';
            ExternalAccess = Read;
            Description = 'Shows who last updated the record on behalf of another user.';
            Caption = 'Modified By (Delegate)';
            TableRelation = "CDS SystemUser".SystemUserId;
        }
        field(228; ModifiedOnBehalfByName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId = field(ModifiedOnBehalfBy)));
            ExternalName = 'modifiedonbehalfbyname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(233; StageId; GUID)
        {
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Shows the ID of the stage.';
            Caption = '(Deprecated) Process Stage';
        }
        field(234; ProcessId; GUID)
        {
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Shows the ID of the process.';
            Caption = 'Process';
        }
        field(235; Address2_Composite; BLOB)
        {
            ExternalName = 'address2_composite';
            ExternalType = 'Memo';
            ExternalAccess = Read;
            Description = 'Shows the complete secondary address.';
            Caption = 'Address 2';
            Subtype = Memo;
        }
        field(236; Address1_Composite; BLOB)
        {
            ExternalName = 'address1_composite';
            ExternalType = 'Memo';
            ExternalAccess = Read;
            Description = 'Shows the complete primary address.';
            Caption = 'Address 1';
            Subtype = Memo;
        }
        field(239; EntityImageId; GUID)
        {
            ExternalName = 'entityimageid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Read;
            Description = 'For internal use only.';
            Caption = 'Entity Image Id';
        }
        field(242; TraversedPath; Text[1250])
        {
            ExternalName = 'traversedpath';
            ExternalType = 'String';
            Description = 'For internal use only.';
            Caption = '(Deprecated) Traversed Path';
        }
        field(246; OnHoldTime; Integer)
        {
            ExternalName = 'onholdtime';
            ExternalType = 'Integer';
            ExternalAccess = Read;
            Description = 'Shows how long, in minutes, that the record was on hold.';
            Caption = 'On Hold Time (Minutes)';
        }
        field(247; LastOnHoldTime; Datetime)
        {
            ExternalName = 'lastonholdtime';
            ExternalType = 'DateTime';
            Description = 'Contains the date and time stamp of the last on hold time.';
            Caption = 'Last On Hold Time';
        }
        field(249; FollowEmail; Boolean)
        {
            ExternalName = 'followemail';
            ExternalType = 'Boolean';
            Description = 'Information about whether to allow following email activity like opens, attachment views and link clicks for emails sent to the contact.';
            Caption = 'Follow Email Activity';
        }
        field(254; TimeSpentByMeOnEmailAndMeetings; Text[1250])
        {
            ExternalName = 'timespentbymeonemailandmeetings';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = 'Total time spent for emails (read and write) and meetings by me in relation to the contact record.';
            Caption = 'Time Spent by me';
        }
        field(259; Address3_Country; Text[80])
        {
            ExternalName = 'address3_country';
            ExternalType = 'String';
            Description = 'the country or region for the 3rd address.';
            Caption = 'Address3: Country/Region';
        }
        field(260; Address3_Line1; Text[250])
        {
            ExternalName = 'address3_line1';
            ExternalType = 'String';
            Description = 'the first line of the 3rd address.';
            Caption = 'Address3: Street 1';
        }
        field(261; Address3_Line2; Text[250])
        {
            ExternalName = 'address3_line2';
            ExternalType = 'String';
            Description = 'the second line of the 3rd address.';
            Caption = 'Address3: Street 2';
        }
        field(262; Address3_Line3; Text[250])
        {
            ExternalName = 'address3_line3';
            ExternalType = 'String';
            Description = 'the third line of the 3rd address.';
            Caption = 'Address3: Street 3';
        }
        field(263; Address3_PostalCode; Text[20])
        {
            ExternalName = 'address3_postalcode';
            ExternalType = 'String';
            Description = 'the ZIP Code or postal code for the 3rd address.';
            Caption = 'Address3: ZIP/Postal Code';
        }
        field(264; Address3_PostOfficeBox; Text[20])
        {
            ExternalName = 'address3_postofficebox';
            ExternalType = 'String';
            Description = 'the post office box number of the 3rd address.';
            Caption = 'Address 3: Post Office Box';
        }
        field(265; Address3_StateOrProvince; Text[50])
        {
            ExternalName = 'address3_stateorprovince';
            ExternalType = 'String';
            Description = 'the state or province of the third address.';
            Caption = 'Address3: State/Province';
        }
        field(266; Address3_City; Text[80])
        {
            ExternalName = 'address3_city';
            ExternalType = 'String';
            Description = 'Type the city for the 3rd address.';
            Caption = 'Address 3: City';
        }
        field(267; Business2; Text[50])
        {
            ExternalName = 'business2';
            ExternalType = 'String';
            Description = 'Type a second business phone number for this contact.';
            Caption = 'Business Phone 2';
        }
        field(268; Callback; Text[50])
        {
            ExternalName = 'callback';
            ExternalType = 'String';
            Description = 'Type a callback phone number for this contact.';
            Caption = 'Callback Number';
        }
        field(270; Company; Text[50])
        {
            ExternalName = 'company';
            ExternalType = 'String';
            Description = 'Type the company phone of the contact.';
            Caption = 'Company Phone';
        }
        field(271; Home2; Text[50])
        {
            ExternalName = 'home2';
            ExternalType = 'String';
            Description = 'Type a second home phone number for this contact.';
            Caption = 'Home Phone 2';
        }
        field(280; Address3_AddressId; GUID)
        {
            ExternalName = 'address3_addressid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Unique identifier for address 3.';
            Caption = 'Address 3: ID';
        }
        field(282; Address3_Composite; BLOB)
        {
            ExternalName = 'address3_composite';
            ExternalType = 'Memo';
            ExternalAccess = Read;
            Description = 'Shows the complete third address.';
            Caption = 'Address 3';
            Subtype = Memo;
        }
        field(283; Address3_Fax; Text[50])
        {
            ExternalName = 'address3_fax';
            ExternalType = 'String';
            Description = 'Type the fax number associated with the third address.';
            Caption = 'Address 3: Fax';
        }
        field(284; Address3_FreightTermsCode; Option)
        {
            ExternalName = 'address3_freighttermscode';
            ExternalType = 'Picklist';
            Description = 'Select the freight terms for the third address to make sure shipping orders are processed correctly.';
            Caption = 'Address 3: Freight Terms';
            InitValue = " ";
            OptionMembers = " ",DefaultValue;
            OptionOrdinalValues = -1, 1;
        }
        field(286; Address3_Latitude; Decimal)
        {
            ExternalName = 'address3_latitude';
            ExternalType = 'Double';
            Description = 'Type the latitude value for the third address for use in mapping and other applications.';
            Caption = 'Address 3: Latitude';
        }
        field(287; Address3_Longitude; Decimal)
        {
            ExternalName = 'address3_longitude';
            ExternalType = 'Double';
            Description = 'Type the longitude value for the third address for use in mapping and other applications.';
            Caption = 'Address 3: Longitude';
        }
        field(288; Address3_Name; Text[200])
        {
            ExternalName = 'address3_name';
            ExternalType = 'String';
            Description = 'Type a descriptive name for the third address, such as Corporate Headquarters.';
            Caption = 'Address 3: Name';
        }
        field(289; Address3_PrimaryContactName; Text[100])
        {
            ExternalName = 'address3_primarycontactname';
            ExternalType = 'String';
            Description = 'Type the name of the main contact at the account''s third address.';
            Caption = 'Address 3: Primary Contact Name';
        }
        field(290; Address3_ShippingMethodCode; Option)
        {
            ExternalName = 'address3_shippingmethodcode';
            ExternalType = 'Picklist';
            Description = 'Select a shipping method for deliveries sent to this address.';
            Caption = 'Address 3: Shipping Method';
            InitValue = " ";
            OptionMembers = " ",DefaultValue;
            OptionOrdinalValues = -1, 1;
        }
        field(292; Address3_Telephone1; Text[50])
        {
            ExternalName = 'address3_telephone1';
            ExternalType = 'String';
            Description = 'Type the main phone number associated with the third address.';
            Caption = 'Address 3: Telephone1';
        }
        field(293; Address3_Telephone2; Text[50])
        {
            ExternalName = 'address3_telephone2';
            ExternalType = 'String';
            Description = 'Type a second phone number associated with the third address.';
            Caption = 'Address 3: Telephone2';
        }
        field(294; Address3_Telephone3; Text[50])
        {
            ExternalName = 'address3_telephone3';
            ExternalType = 'String';
            Description = 'Type a third phone number associated with the primary address.';
            Caption = 'Address 3: Telephone3';
        }
        field(295; Address3_UPSZone; Text[4])
        {
            ExternalName = 'address3_upszone';
            ExternalType = 'String';
            Description = 'Type the UPS zone of the third address to make sure shipping charges are calculated correctly and deliveries are made promptly, if shipped by UPS.';
            Caption = 'Address 3: UPS Zone';
        }
        field(296; Address3_UTCOffset; Integer)
        {
            ExternalName = 'address3_utcoffset';
            ExternalType = 'Integer';
            Description = 'Select the time zone, or UTC offset, for this address so that other people can reference it when they contact someone at this address.';
            Caption = 'Address 3: UTC Offset';
        }
        field(297; Address3_County; Text[50])
        {
            ExternalName = 'address3_county';
            ExternalType = 'String';
            Description = 'Type the county for the third address.';
            Caption = 'Address 3: County';
        }
        field(298; Address3_AddressTypeCode; Option)
        {
            ExternalName = 'address3_addresstypecode';
            ExternalType = 'Picklist';
            Description = 'Select the third address type.';
            Caption = 'Address 3: Address Type';
            InitValue = " ";
            OptionMembers = " ",DefaultValue;
            OptionOrdinalValues = -1, 1;
        }
        field(306; MarketingOnly; Boolean)
        {
            ExternalName = 'marketingonly';
            ExternalType = 'Boolean';
            Description = 'Whether is only for marketing';
            Caption = 'Marketing Only';
        }
        field(10003; DefaultPriceLevelId; GUID)
        {
            ExternalName = 'defaultpricelevelid';
            ExternalType = 'Lookup';
            Description = 'Choose the default price list associated with the contact to make sure the correct product prices for this customer are applied in sales opportunities, quotes, and orders.';
            Caption = 'Price List';
            TableRelation = "CDS PriceLevel".PriceLevelId;
        }
        field(10004; DefaultPriceLevelIdName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS PriceLevel".Name where(PriceLevelId = field(DefaultPriceLevelId)));
            ExternalName = 'defaultpricelevelidname';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(10009; TeamsFollowed; Integer)
        {
            ExternalName = 'teamsfollowed';
            ExternalType = 'Integer';
            Description = 'Number of users or conversations followed the record';
            Caption = 'TeamsFollowed';
        }
        field(10010; BusinessCard; BLOB)
        {
            ExternalName = 'businesscard';
            ExternalType = 'Memo';
            Description = 'Stores Image of the Business Card';
            Caption = 'Business Card';
            Subtype = Memo;
        }
        field(10011; BusinessCardAttributes; Text[2048])
        {
            ExternalName = 'businesscardattributes';
            ExternalType = 'String';
            Description = 'Stores Business Card Control Properties.';
            Caption = 'BusinessCardAttributes';
        }
        field(10012; msdyn_orgchangestatus; Option)
        {
            ExternalName = 'msdyn_orgchangestatus';
            ExternalType = 'Picklist';
            Description = 'Whether or not the contact belongs to the associated account';
            Caption = 'Not at Company Flag';
            InitValue = NoFeedback;
            OptionMembers = NoFeedback,NotAtCompany,Ignore;
            OptionOrdinalValues = 0, 1, 2;
        }
        field(10014; msdyn_gdproptout; Boolean)
        {
            ExternalName = 'msdyn_gdproptout';
            ExternalType = 'Boolean';
            Description = 'Describes whether contact is opted out or not';
            Caption = 'GDPR Optout';
        }
        field(10016; new_youtube; Text[100])
        {
            ExternalName = 'new_youtube';
            ExternalType = 'String';
            Description = '';
            Caption = 'youtube';
            trigger OnValidate()
            begin
                new_youtube := new_youtube + ' Hello!!';
            end;
        }
    }
    keys
    {
        key(PK; ContactId)
        {
            Clustered = true;
        }
        key(Name; FullName)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; FullName)
        {
        }
    }
}