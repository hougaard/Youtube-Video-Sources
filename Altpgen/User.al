table 50104 "CDS SystemUser"
{
  ExternalName = 'systemuser';
  TableType = CDS;
  Description = 'Person with access to the Microsoft CRM system and who owns objects in the Microsoft CRM database.';

  fields
  {
    field(1;SystemUserId;GUID)
    {
      ExternalName = 'systemuserid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier for the user.';
      Caption = 'User';
    }
    field(4;OrganizationId;GUID)
    {
      ExternalName = 'organizationid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
      Description = 'Unique identifier of the organization associated with the user.';
      Caption = 'Organization ';
    }
    field(5;BusinessUnitId;GUID)
    {
      ExternalName = 'businessunitid';
      ExternalType = 'Lookup';
      Description = 'Unique identifier of the business unit with which the user is associated.';
      Caption = 'Business Unit';
      TableRelation = "CDS BusinessUnit".BusinessUnitId;
    }
    field(6;ParentSystemUserId;GUID)
    {
      ExternalName = 'parentsystemuserid';
      ExternalType = 'Lookup';
      Description = 'Unique identifier of the manager of the user.';
      Caption = 'Manager';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(7;FirstName;Text[256])
    {
      ExternalName = 'firstname';
      ExternalType = 'String';
      Description = 'First name of the user.';
      Caption = 'First Name';
    }
    field(8;Salutation;Text[20])
    {
      ExternalName = 'salutation';
      ExternalType = 'String';
      Description = 'Salutation for correspondence with the user.';
      Caption = 'Salutation';
    }
    field(9;MiddleName;Text[50])
    {
      ExternalName = 'middlename';
      ExternalType = 'String';
      Description = 'Middle name of the user.';
      Caption = 'Middle Name';
    }
    field(10;LastName;Text[256])
    {
      ExternalName = 'lastname';
      ExternalType = 'String';
      Description = 'Last name of the user.';
      Caption = 'Last Name';
    }
    field(11;PersonalEMailAddress;Text[100])
    {
      ExternalName = 'personalemailaddress';
      ExternalType = 'String';
      Description = 'Personal email address of the user.';
      Caption = 'Email 2';
    }
    field(12;FullName;Text[200])
    {
      ExternalName = 'fullname';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Full name of the user.';
      Caption = 'Full Name';
    }
    field(13;NickName;Text[50])
    {
      ExternalName = 'nickname';
      ExternalType = 'String';
      Description = 'Nickname of the user.';
      Caption = 'Nickname';
    }
    field(14;Title;Text[128])
    {
      ExternalName = 'title';
      ExternalType = 'String';
      Description = 'Title of the user.';
      Caption = 'Title';
    }
    field(15;InternalEMailAddress;Text[100])
    {
      ExternalName = 'internalemailaddress';
      ExternalType = 'String';
      Description = 'Internal email address for the user.';
      Caption = 'Primary Email';
    }
    field(16;JobTitle;Text[100])
    {
      ExternalName = 'jobtitle';
      ExternalType = 'String';
      Description = 'Job title of the user.';
      Caption = 'Job Title';
    }
    field(17;MobileAlertEMail;Text[100])
    {
      ExternalName = 'mobilealertemail';
      ExternalType = 'String';
      Description = 'Mobile alert email address for the user.';
      Caption = 'Mobile Alert Email';
    }
    field(18;PreferredEmailCode;Option)
    {
      ExternalName = 'preferredemailcode';
      ExternalType = 'Picklist';
      Description = 'Preferred email address for the user.';
      Caption = 'Preferred Email';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(19;HomePhone;Text[50])
    {
      ExternalName = 'homephone';
      ExternalType = 'String';
      Description = 'Home phone number for the user.';
      Caption = 'Home Phone';
    }
    field(20;MobilePhone;Text[64])
    {
      ExternalName = 'mobilephone';
      ExternalType = 'String';
      Description = 'Mobile phone number for the user.';
      Caption = 'Mobile Phone';
    }
    field(21;PreferredPhoneCode;Option)
    {
      ExternalName = 'preferredphonecode';
      ExternalType = 'Picklist';
      Description = 'Preferred phone number for the user.';
      Caption = 'Preferred Phone';
      InitValue = MainPhone;
      OptionMembers = MainPhone, OtherPhone, HomePhone, MobilePhone;
      OptionOrdinalValues = 1, 2, 3, 4;
    }
    field(22;PreferredAddressCode;Option)
    {
      ExternalName = 'preferredaddresscode';
      ExternalType = 'Picklist';
      Description = 'Preferred address for the user.';
      Caption = 'Preferred Address';
      InitValue = MailingAddress;
      OptionMembers = MailingAddress, OtherAddress;
      OptionOrdinalValues = 1, 2;
    }
    field(23;PhotoUrl;Text[200])
    {
      ExternalName = 'photourl';
      ExternalType = 'String';
      Description = 'URL for the Website on which a photo of the user is located.';
      Caption = 'Photo URL';
    }
    field(24;DomainName;Text[1024])
    {
      ExternalName = 'domainname';
      ExternalType = 'String';
      Description = 'Active Directory domain of which the user is a member.';
      Caption = 'User Name';
    }
    field(25;PassportLo;Integer)
    {
      ExternalName = 'passportlo';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Passport Lo';
    }
    field(26;CreatedOn;Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the user was created.';
      Caption = 'Created On';
    }
    field(27;PassportHi;Integer)
    {
      ExternalName = 'passporthi';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Passport Hi';
    }
    field(28;DisabledReason;Text[500])
    {
      ExternalName = 'disabledreason';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Reason for disabling the user.';
      Caption = 'Disabled Reason';
    }
    field(29;ModifiedOn;Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the user was last modified.';
      Caption = 'Modified On';
    }
    field(31;CreatedBy;GUID)
    {
      ExternalName = 'createdby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who created the user.';
      Caption = 'Created By';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(32;EmployeeId;Text[100])
    {
      ExternalName = 'employeeid';
      ExternalType = 'String';
      Description = 'Employee identifier for the user.';
      Caption = 'Employee';
    }
    field(33;ModifiedBy;GUID)
    {
      ExternalName = 'modifiedby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who last modified the user.';
      Caption = 'Modified By';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(34;IsDisabled;Boolean)
    {
      ExternalName = 'isdisabled';
      ExternalType = 'Boolean';
      ExternalAccess = Modify;
      Description = 'Information about whether the user is enabled.';
      Caption = 'Status';
    }
    field(35;GovernmentId;Text[100])
    {
      ExternalName = 'governmentid';
      ExternalType = 'String';
      Description = 'Government identifier for the user.';
      Caption = 'Government';
    }
    field(36;VersionNumber;BigInteger)
    {
      ExternalName = 'versionnumber';
      ExternalType = 'BigInt';
      ExternalAccess = Read;
      Description = 'Version number of the user.';
      Caption = 'Version number';
    }
    field(37;ParentSystemUserIdName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(ParentSystemUserId)));
      ExternalName = 'parentsystemuseridname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(41;Address1_AddressId;GUID)
    {
      ExternalName = 'address1_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 1.';
      Caption = 'Address 1: ID';
    }
    field(42;Address1_AddressTypeCode;Option)
    {
      ExternalName = 'address1_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Type of address for address 1, such as billing, shipping, or primary address.';
      Caption = 'Address 1: Address Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(43;Address1_Name;Text[100])
    {
      ExternalName = 'address1_name';
      ExternalType = 'String';
      Description = 'Name to enter for address 1.';
      Caption = 'Address 1: Name';
    }
    field(44;Address1_Line1;Text[1024])
    {
      ExternalName = 'address1_line1';
      ExternalType = 'String';
      Description = 'First line for entering address 1 information.';
      Caption = 'Street 1';
    }
    field(45;Address1_Line2;Text[1024])
    {
      ExternalName = 'address1_line2';
      ExternalType = 'String';
      Description = 'Second line for entering address 1 information.';
      Caption = 'Street 2';
    }
    field(46;Address1_Line3;Text[1024])
    {
      ExternalName = 'address1_line3';
      ExternalType = 'String';
      Description = 'Third line for entering address 1 information.';
      Caption = 'Street 3';
    }
    field(47;Address1_City;Text[128])
    {
      ExternalName = 'address1_city';
      ExternalType = 'String';
      Description = 'City name for address 1.';
      Caption = 'City';
    }
    field(48;Address1_StateOrProvince;Text[128])
    {
      ExternalName = 'address1_stateorprovince';
      ExternalType = 'String';
      Description = 'State or province for address 1.';
      Caption = 'State/Province';
    }
    field(49;Address1_County;Text[128])
    {
      ExternalName = 'address1_county';
      ExternalType = 'String';
      Description = 'County name for address 1.';
      Caption = 'Address 1: County';
    }
    field(50;Address1_Country;Text[128])
    {
      ExternalName = 'address1_country';
      ExternalType = 'String';
      Description = 'Country/region name in address 1.';
      Caption = 'Country/Region';
    }
    field(51;Address1_PostOfficeBox;Text[40])
    {
      ExternalName = 'address1_postofficebox';
      ExternalType = 'String';
      Description = 'Post office box number for address 1.';
      Caption = 'Address 1: Post Office Box';
    }
    field(52;Address1_PostalCode;Text[40])
    {
      ExternalName = 'address1_postalcode';
      ExternalType = 'String';
      Description = 'ZIP Code or postal code for address 1.';
      Caption = 'ZIP/Postal Code';
    }
    field(53;Address1_UTCOffset;Integer)
    {
      ExternalName = 'address1_utcoffset';
      ExternalType = 'Integer';
      Description = 'UTC offset for address 1. This is the difference between local time and standard Coordinated Universal Time.';
      Caption = 'Address 1: UTC Offset';
    }
    field(54;Address1_UPSZone;Text[4])
    {
      ExternalName = 'address1_upszone';
      ExternalType = 'String';
      Description = 'United Parcel Service (UPS) zone for address 1.';
      Caption = 'Address 1: UPS Zone';
    }
    field(55;Address1_Latitude;Decimal)
    {
      ExternalName = 'address1_latitude';
      ExternalType = 'Double';
      Description = 'Latitude for address 1.';
      Caption = 'Address 1: Latitude';
    }
    field(56;Address1_Telephone1;Text[64])
    {
      ExternalName = 'address1_telephone1';
      ExternalType = 'String';
      Description = 'First telephone number associated with address 1.';
      Caption = 'Main Phone';
    }
    field(57;Address1_Longitude;Decimal)
    {
      ExternalName = 'address1_longitude';
      ExternalType = 'Double';
      Description = 'Longitude for address 1.';
      Caption = 'Address 1: Longitude';
    }
    field(58;Address1_ShippingMethodCode;Option)
    {
      ExternalName = 'address1_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Method of shipment for address 1.';
      Caption = 'Address 1: Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(59;Address1_Telephone2;Text[50])
    {
      ExternalName = 'address1_telephone2';
      ExternalType = 'String';
      Description = 'Second telephone number associated with address 1.';
      Caption = 'Other Phone';
    }
    field(60;Address1_Telephone3;Text[50])
    {
      ExternalName = 'address1_telephone3';
      ExternalType = 'String';
      Description = 'Third telephone number associated with address 1.';
      Caption = 'Pager';
    }
    field(61;Address1_Fax;Text[64])
    {
      ExternalName = 'address1_fax';
      ExternalType = 'String';
      Description = 'Fax number for address 1.';
      Caption = 'Address 1: Fax';
    }
    field(62;Address2_AddressId;GUID)
    {
      ExternalName = 'address2_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 2.';
      Caption = 'Address 2: ID';
    }
    field(63;Address2_AddressTypeCode;Option)
    {
      ExternalName = 'address2_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Type of address for address 2, such as billing, shipping, or primary address.';
      Caption = 'Address 2: Address Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(64;Address2_Name;Text[100])
    {
      ExternalName = 'address2_name';
      ExternalType = 'String';
      Description = 'Name to enter for address 2.';
      Caption = 'Address 2: Name';
    }
    field(65;Address2_Line1;Text[1024])
    {
      ExternalName = 'address2_line1';
      ExternalType = 'String';
      Description = 'First line for entering address 2 information.';
      Caption = 'Other Street 1';
    }
    field(66;Address2_Line2;Text[1024])
    {
      ExternalName = 'address2_line2';
      ExternalType = 'String';
      Description = 'Second line for entering address 2 information.';
      Caption = 'Other Street 2';
    }
    field(67;Address2_Line3;Text[1024])
    {
      ExternalName = 'address2_line3';
      ExternalType = 'String';
      Description = 'Third line for entering address 2 information.';
      Caption = 'Other Street 3';
    }
    field(68;Address2_City;Text[128])
    {
      ExternalName = 'address2_city';
      ExternalType = 'String';
      Description = 'City name for address 2.';
      Caption = 'Other City';
    }
    field(69;Address2_StateOrProvince;Text[128])
    {
      ExternalName = 'address2_stateorprovince';
      ExternalType = 'String';
      Description = 'State or province for address 2.';
      Caption = 'Other State/Province';
    }
    field(70;Address2_County;Text[128])
    {
      ExternalName = 'address2_county';
      ExternalType = 'String';
      Description = 'County name for address 2.';
      Caption = 'Address 2: County';
    }
    field(71;Address2_Country;Text[128])
    {
      ExternalName = 'address2_country';
      ExternalType = 'String';
      Description = 'Country/region name in address 2.';
      Caption = 'Other Country/Region';
    }
    field(72;Address2_PostOfficeBox;Text[40])
    {
      ExternalName = 'address2_postofficebox';
      ExternalType = 'String';
      Description = 'Post office box number for address 2.';
      Caption = 'Address 2: Post Office Box';
    }
    field(73;Address2_PostalCode;Text[40])
    {
      ExternalName = 'address2_postalcode';
      ExternalType = 'String';
      Description = 'ZIP Code or postal code for address 2.';
      Caption = 'Other ZIP/Postal Code';
    }
    field(74;Address2_UTCOffset;Integer)
    {
      ExternalName = 'address2_utcoffset';
      ExternalType = 'Integer';
      Description = 'UTC offset for address 2. This is the difference between local time and standard Coordinated Universal Time.';
      Caption = 'Address 2: UTC Offset';
    }
    field(75;Address2_UPSZone;Text[4])
    {
      ExternalName = 'address2_upszone';
      ExternalType = 'String';
      Description = 'United Parcel Service (UPS) zone for address 2.';
      Caption = 'Address 2: UPS Zone';
    }
    field(76;Address2_Latitude;Decimal)
    {
      ExternalName = 'address2_latitude';
      ExternalType = 'Double';
      Description = 'Latitude for address 2.';
      Caption = 'Address 2: Latitude';
    }
    field(77;Address2_Telephone1;Text[50])
    {
      ExternalName = 'address2_telephone1';
      ExternalType = 'String';
      Description = 'First telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 1';
    }
    field(78;Address2_Longitude;Decimal)
    {
      ExternalName = 'address2_longitude';
      ExternalType = 'Double';
      Description = 'Longitude for address 2.';
      Caption = 'Address 2: Longitude';
    }
    field(79;Address2_ShippingMethodCode;Option)
    {
      ExternalName = 'address2_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Method of shipment for address 2.';
      Caption = 'Address 2: Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(80;Address2_Telephone2;Text[50])
    {
      ExternalName = 'address2_telephone2';
      ExternalType = 'String';
      Description = 'Second telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 2';
    }
    field(81;Address2_Telephone3;Text[50])
    {
      ExternalName = 'address2_telephone3';
      ExternalType = 'String';
      Description = 'Third telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 3';
    }
    field(82;Address2_Fax;Text[50])
    {
      ExternalName = 'address2_fax';
      ExternalType = 'String';
      Description = 'Fax number for address 2.';
      Caption = 'Address 2: Fax';
    }
    field(83;CreatedByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(CreatedBy)));
      ExternalName = 'createdbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(85;ModifiedByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(ModifiedBy)));
      ExternalName = 'modifiedbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(87;BusinessUnitIdName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS BusinessUnit".Name where(BusinessUnitId=field(BusinessUnitId)));
      ExternalName = 'businessunitidname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(99;Skills;Text[100])
    {
      ExternalName = 'skills';
      ExternalType = 'String';
      Description = 'Skill set of the user.';
      Caption = 'Skills';
    }
    field(100;DisplayInServiceViews;Boolean)
    {
      ExternalName = 'displayinserviceviews';
      ExternalType = 'Boolean';
      Description = 'Whether to display the user in service views.';
      Caption = 'Display in Service Views';
    }
    field(103;SetupUser;Boolean)
    {
      ExternalName = 'setupuser';
      ExternalType = 'Boolean';
      Description = 'Check if user is a setup user.';
      Caption = 'Restricted Access Mode';
    }
    field(109;WindowsLiveID;Text[1024])
    {
      ExternalName = 'windowsliveid';
      ExternalType = 'String';
      Description = 'Windows Live ID';
      Caption = 'Windows Live ID';
    }
    field(110;IncomingEmailDeliveryMethod;Option)
    {
      ExternalName = 'incomingemaildeliverymethod';
      ExternalType = 'Picklist';
      Description = 'Incoming email delivery method for the user.';
      Caption = 'Incoming Email Delivery Method';
      InitValue = MicrosoftDynamics365ForOutlook;
      OptionMembers = None, MicrosoftDynamics365ForOutlook, "Server-SideSynchronizationOrEmailRouter", ForwardMailbox;
      OptionOrdinalValues = 0, 1, 2, 3;
    }
    field(111;OutgoingEmailDeliveryMethod;Option)
    {
      ExternalName = 'outgoingemaildeliverymethod';
      ExternalType = 'Picklist';
      Description = 'Outgoing email delivery method for the user.';
      Caption = 'Outgoing Email Delivery Method';
      InitValue = MicrosoftDynamics365ForOutlook;
      OptionMembers = None, MicrosoftDynamics365ForOutlook, "Server-SideSynchronizationOrEmailRouter";
      OptionOrdinalValues = 0, 1, 2;
    }
    field(112;ImportSequenceNumber;Integer)
    {
      ExternalName = 'importsequencenumber';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the data import or data migration that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(113;AccessMode;Option)
    {
      ExternalName = 'accessmode';
      ExternalType = 'Picklist';
      Description = 'Type of user.';
      Caption = 'Access Mode';
      InitValue = "Read-Write";
      OptionMembers = "Read-Write", Administrative, Read, SupportUser, "Non-interactive", DelegatedAdmin;
      OptionOrdinalValues = 0, 1, 2, 3, 4, 5;
    }
    field(114;InviteStatusCode;Option)
    {
      ExternalName = 'invitestatuscode';
      ExternalType = 'Picklist';
      Description = 'User invitation status.';
      Caption = 'Invitation Status';
      InitValue = InvitationNotSent;
      OptionMembers = InvitationNotSent, Invited, InvitationNearExpired, InvitationExpired, InvitationAccepted, InvitationRejected, InvitationRevoked;
      OptionOrdinalValues = 0, 1, 2, 3, 4, 5, 6;
    }
    field(116;OverriddenCreatedOn;Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
      Caption = 'Record Created On';
    }
    field(117;UTCConversionTimeZoneCode;Integer)
    {
      ExternalName = 'utcconversiontimezonecode';
      ExternalType = 'Integer';
      Description = 'Time zone code that was in use when the record was created.';
      Caption = 'UTC Conversion Time Zone Code';
    }
    field(118;TimeZoneRuleVersionNumber;Integer)
    {
      ExternalName = 'timezoneruleversionnumber';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Time Zone Rule Version Number';
    }
    field(124;YomiFullName;Text[200])
    {
      ExternalName = 'yomifullname';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Pronunciation of the full name of the user, written in phonetic hiragana or katakana characters.';
      Caption = 'Yomi Full Name';
    }
    field(126;YomiLastName;Text[64])
    {
      ExternalName = 'yomilastname';
      ExternalType = 'String';
      Description = 'Pronunciation of the last name of the user, written in phonetic hiragana or katakana characters.';
      Caption = 'Yomi Last Name';
    }
    field(128;YomiMiddleName;Text[50])
    {
      ExternalName = 'yomimiddlename';
      ExternalType = 'String';
      Description = 'Pronunciation of the middle name of the user, written in phonetic hiragana or katakana characters.';
      Caption = 'Yomi Middle Name';
    }
    field(129;YomiFirstName;Text[64])
    {
      ExternalName = 'yomifirstname';
      ExternalType = 'String';
      Description = 'Pronunciation of the first name of the user, written in phonetic hiragana or katakana characters.';
      Caption = 'Yomi First Name';
    }
    field(130;IsIntegrationUser;Boolean)
    {
      ExternalName = 'isintegrationuser';
      ExternalType = 'Boolean';
      Description = 'Check if user is an integration user.';
      Caption = 'Integration user mode';
    }
    field(131;DefaultFiltersPopulated;Boolean)
    {
      ExternalName = 'defaultfilterspopulated';
      ExternalType = 'Boolean';
      ExternalAccess = Read;
      Description = 'Indicates if default outlook filters have been populated.';
      Caption = 'Default Filters Populated';
    }
    field(133;CreatedOnBehalfBy;GUID)
    {
      ExternalName = 'createdonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who created the systemuser.';
      Caption = 'Created By (Delegate)';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(137;ModifiedOnBehalfBy;GUID)
    {
      ExternalName = 'modifiedonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who last modified the systemuser.';
      Caption = 'Modified By (Delegate)';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(139;ModifiedOnBehalfByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(ModifiedOnBehalfBy)));
      ExternalName = 'modifiedonbehalfbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(141;CreatedOnBehalfByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(CreatedOnBehalfBy)));
      ExternalName = 'createdonbehalfbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(143;EmailRouterAccessApproval;Option)
    {
      ExternalName = 'emailrouteraccessapproval';
      ExternalType = 'Picklist';
      ExternalAccess = Modify;
      Description = 'Shows the status of the primary email address.';
      Caption = 'Primary Email Status';
      InitValue = Empty;
      OptionMembers = Empty, Approved, PendingApproval, Rejected;
      OptionOrdinalValues = 0, 1, 2, 3;
    }
    field(147;ExchangeRate;Decimal)
    {
      ExternalName = 'exchangerate';
      ExternalType = 'Decimal';
      ExternalAccess = Read;
      Description = 'Exchange rate for the currency associated with the systemuser with respect to the base currency.';
      Caption = 'Exchange Rate';
    }
    field(148;CALType;Option)
    {
      ExternalName = 'caltype';
      ExternalType = 'Picklist';
      Description = 'License type of user.';
      Caption = 'License Type';
      InitValue = Professional;
      OptionMembers = Professional, Administrative, Basic, DeviceProfessional, DeviceBasic, Essential, DeviceEssential, Enterprise, DeviceEnterprise, Sales, Service, FieldService, ProjectService;
      OptionOrdinalValues = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12;
    }
    field(150;IsLicensed;Boolean)
    {
      ExternalName = 'islicensed';
      ExternalType = 'Boolean';
      Description = 'Information about whether the user is licensed.';
      Caption = 'User Licensed';
    }
    field(151;IsSyncWithDirectory;Boolean)
    {
      ExternalName = 'issyncwithdirectory';
      ExternalType = 'Boolean';
      Description = 'Information about whether the user is synced with the directory.';
      Caption = 'User Synced';
    }
    field(152;YammerEmailAddress;Text[200])
    {
      ExternalName = 'yammeremailaddress';
      ExternalType = 'String';
      Description = 'User''s Yammer login email address';
      Caption = 'Yammer Email';
    }
    field(154;YammerUserId;Text[128])
    {
      ExternalName = 'yammeruserid';
      ExternalType = 'String';
      Description = 'User''s Yammer ID';
      Caption = 'Yammer User ID';
    }
    field(156;UserLicenseType;Integer)
    {
      ExternalName = 'userlicensetype';
      ExternalType = 'Integer';
      Description = 'Shows the type of user license.';
      Caption = 'User License Type';
    }
    field(157;EntityImageId;GUID)
    {
      ExternalName = 'entityimageid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
      Description = 'For internal use only.';
      Caption = 'Entity Image Id';
    }
    field(160;Address2_Composite;BLOB)
    {
      ExternalName = 'address2_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete secondary address.';
      Caption = 'Other Address';
      Subtype = Memo;
    }
    field(161;Address1_Composite;BLOB)
    {
      ExternalName = 'address1_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete primary address.';
      Caption = 'Address';
      Subtype = Memo;
    }
    field(162;ProcessId;GUID)
    {
      ExternalName = 'processid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Shows the ID of the process.';
      Caption = 'Process';
    }
    field(163;StageId;GUID)
    {
      ExternalName = 'stageid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Shows the ID of the stage.';
      Caption = '(Deprecated) Process Stage';
    }
    field(165;IsEmailAddressApprovedByO365Admin;Boolean)
    {
      ExternalName = 'isemailaddressapprovedbyo365admin';
      ExternalType = 'Boolean';
      ExternalAccess = Read;
      Description = 'Shows the status of approval of the email address by O365 Admin.';
      Caption = 'Email Address O365 Admin Approval Status';
    }
    field(172;TraversedPath;Text[1250])
    {
      ExternalName = 'traversedpath';
      ExternalType = 'String';
      Description = 'For internal use only.';
      Caption = '(Deprecated) Traversed Path';
    }
    field(173;SharePointEmailAddress;Text[1024])
    {
      ExternalName = 'sharepointemailaddress';
      ExternalType = 'String';
      Description = 'SharePoint Work Email Address';
      Caption = 'SharePoint Email Address';
    }
    field(181;DefaultOdbFolderName;Text[200])
    {
      ExternalName = 'defaultodbfoldername';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Type a default folder name for the user''s OneDrive For Business location.';
      Caption = 'Default OneDrive for Business Folder Name';
    }
    field(182;ApplicationId;GUID)
    {
      ExternalName = 'applicationid';
      ExternalType = 'Uniqueidentifier';
      Description = 'The identifier for the application. This is used to access data in another application.';
      Caption = 'Application ID';
    }
    field(183;ApplicationIdUri;Text[1024])
    {
      ExternalName = 'applicationiduri';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'The URI used as a unique logical identifier for the external app. This can be used to validate the application.';
      Caption = 'Application ID URI';
    }
    field(184;AzureActiveDirectoryObjectId;GUID)
    {
      ExternalName = 'azureactivedirectoryobjectid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
      Description = 'This is the application directory object Id.';
      Caption = 'Azure AD Object ID';
    }
    field(185;IdentityId;Integer)
    {
      ExternalName = 'identityid';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'For internal use only.';
      Caption = 'Unique user identity id';
    }
    field(187;UserPuid;Text[100])
    {
      ExternalName = 'userpuid';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = ' User PUID User Identifiable Information';
      Caption = 'User PUID';
    }
    field(10004;msdyn_gdproptout;Boolean)
    {
      ExternalName = 'msdyn_gdproptout';
      ExternalType = 'Boolean';
      Description = 'Describes whether user is opted out or not';
      Caption = 'GDPR Optout';
    }
    field(10006;msdyn_Capacity;Integer)
    {
      ExternalName = 'msdyn_capacity';
      ExternalType = 'Integer';
      Description = 'Capacity associated with the User.';
      Caption = 'Capacity';
    }
    field(10008;msdyn_BotDescription;BLOB)
    {
      ExternalName = 'msdyn_botdescription';
      ExternalType = 'Memo';
      Description = 'BOT User Description';
      Caption = 'Description';
      Subtype = Memo;
    }
    field(10009;msdyn_BotEndpoint;Text[100])
    {
      ExternalName = 'msdyn_botendpoint';
      ExternalType = 'String';
      Description = 'Bot User Endpoint';
      Caption = 'Endpoint';
    }
    field(10010;msdyn_BotSecretKeys;Text[100])
    {
      ExternalName = 'msdyn_botsecretkeys';
      ExternalType = 'String';
      Description = 'Bot User Secret Keys';
      Caption = 'Secret Keys';
    }
    field(10011;msdyn_UserType;Option)
    {
      ExternalName = 'msdyn_usertype';
      ExternalType = 'Picklist';
      Description = 'Type of user - CRM or BOT user';
      Caption = 'Type';
      InitValue = CRMUser;
      OptionMembers = CRMUser, BOTUser;
      OptionOrdinalValues = 192350000, 192350001;
    }
    field(10014;msdyn_gridwrappercontrolfield;Text[2048])
    {
      ExternalName = 'msdyn_gridwrappercontrolfield';
      ExternalType = 'String';
      Description = 'Field to bind grid wrapper control';
      Caption = 'Grid Wrapper Control field';
    }
    field(10015;msdyn_BotApplicationId;Text[100])
    {
      ExternalName = 'msdyn_botapplicationid';
      ExternalType = 'String';
      Description = 'Application ID of the bot.';
      Caption = 'Bot application ID';
    }
    field(10016;msdyn_AgentType;Option)
    {
      ExternalName = 'msdyn_agentType';
      ExternalType = 'Picklist';
      Description = 'Type of user - Application user or Bot application user';
      Caption = 'User type';
      InitValue = ApplicationUser;
      OptionMembers = ApplicationUser, BotApplicationUser;
      OptionOrdinalValues = 192350000, 192350001;
    }
    field(10018;msdyn_BotProvider;Option)
    {
      ExternalName = 'msdyn_botprovider';
      ExternalType = 'Picklist';
      Description = 'Indicates the type of bot';
      Caption = 'Bot Provider';
      InitValue = Other;
      OptionMembers = VirtualAgent, Other, None;
      OptionOrdinalValues = 192350000, 192350001, 192350002;
    }
  }
  keys
  {
    key(PK;SystemUserId)
    {
      Clustered = true;
    }
    key(Name;FullName)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(Dropdown;FullName)
    {
    }
  }
}