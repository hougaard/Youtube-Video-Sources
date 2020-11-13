table 50103 "CDS BusinessUnit"
{
  ExternalName = 'businessunit';
  TableType = CDS;
  Description = 'Business, division, or department in the Microsoft Dynamics 365 database.';

  fields
  {
    field(1;BusinessUnitId;GUID)
    {
      ExternalName = 'businessunitid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the business unit.';
      Caption = 'Business Unit';
    }
    field(5;Name;Text[160])
    {
      ExternalName = 'name';
      ExternalType = 'String';
      Description = 'Name of the business unit.';
      Caption = 'Name';
    }
    field(6;Description;BLOB)
    {
      ExternalName = 'description';
      ExternalType = 'Memo';
      Description = 'Description of the business unit.';
      Caption = 'Description';
      Subtype = Memo;
    }
    field(7;DivisionName;Text[100])
    {
      ExternalName = 'divisionname';
      ExternalType = 'String';
      Description = 'Name of the division to which the business unit belongs.';
      Caption = 'Division';
    }
    field(8;FileAsName;Text[100])
    {
      ExternalName = 'fileasname';
      ExternalType = 'String';
      Description = 'Alternative name under which the business unit can be filed.';
      Caption = 'File as Name';
    }
    field(9;TickerSymbol;Text[10])
    {
      ExternalName = 'tickersymbol';
      ExternalType = 'String';
      Description = 'Stock exchange ticker symbol for the business unit.';
      Caption = 'Ticker Symbol';
    }
    field(10;StockExchange;Text[20])
    {
      ExternalName = 'stockexchange';
      ExternalType = 'String';
      Description = 'Stock exchange on which the business is listed.';
      Caption = 'Stock Exchange';
    }
    field(11;UTCOffset;Integer)
    {
      ExternalName = 'utcoffset';
      ExternalType = 'Integer';
      Description = 'UTC offset for the business unit. This is the difference between local time and standard Coordinated Universal Time.';
      Caption = 'UTC Offset';
    }
    field(12;CreatedOn;Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the business unit was created.';
      Caption = 'Created On';
    }
    field(13;ModifiedOn;Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the business unit was last modified.';
      Caption = 'Modified On';
    }
    field(15;CreditLimit;Decimal)
    {
      ExternalName = 'creditlimit';
      ExternalType = 'Double';
      Description = 'Credit limit for the business unit.';
      Caption = 'Credit Limit';
    }
    field(16;CostCenter;Text[100])
    {
      ExternalName = 'costcenter';
      ExternalType = 'String';
      Description = 'Name of the business unit cost center.';
      Caption = 'Cost Center';
    }
    field(17;WebSiteUrl;Text[200])
    {
      ExternalName = 'websiteurl';
      ExternalType = 'String';
      Description = 'Website URL for the business unit.';
      Caption = 'Website';
    }
    field(18;FtpSiteUrl;Text[200])
    {
      ExternalName = 'ftpsiteurl';
      ExternalType = 'String';
      Description = 'FTP site URL for the business unit.';
      Caption = 'FTP Site';
    }
    field(19;EMailAddress;Text[100])
    {
      ExternalName = 'emailaddress';
      ExternalType = 'String';
      Description = 'Email address for the business unit.';
      Caption = 'Email';
    }
    field(20;InheritanceMask;Integer)
    {
      ExternalName = 'inheritancemask';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Inheritance mask for the business unit.';
      Caption = 'Inheritance Mask';
    }
    field(21;CreatedBy;GUID)
    {
      ExternalName = 'createdby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who created the business unit.';
      Caption = 'Created By';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(22;ModifiedBy;GUID)
    {
      ExternalName = 'modifiedby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who last modified the business unit.';
      Caption = 'Modified By';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(23;WorkflowSuspended;Boolean)
    {
      ExternalName = 'workflowsuspended';
      ExternalType = 'Boolean';
      Description = 'Information about whether workflow or sales process rules have been suspended.';
      Caption = 'Workflow Suspended';
    }
    field(24;ParentBusinessUnitId;GUID)
    {
      ExternalName = 'parentbusinessunitid';
      ExternalType = 'Lookup';
      Description = 'Unique identifier for the parent business unit.';
      Caption = 'Parent Business';
      TableRelation = "CDS BusinessUnit".BusinessUnitId;
    }
    field(25;IsDisabled;Boolean)
    {
      ExternalName = 'isdisabled';
      ExternalType = 'Boolean';
      ExternalAccess = Modify;
      Description = 'Information about whether the business unit is enabled or disabled.';
      Caption = 'Is Disabled';
    }
    field(26;DisabledReason;Text[500])
    {
      ExternalName = 'disabledreason';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Reason for disabling the business unit.';
      Caption = 'Disable Reason';
    }
    field(27;VersionNumber;BigInteger)
    {
      ExternalName = 'versionnumber';
      ExternalType = 'BigInt';
      ExternalAccess = Read;
      Description = 'Version number of the business unit.';
      Caption = 'Version number';
    }
    field(28;ParentBusinessUnitIdName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS BusinessUnit".Name where(BusinessUnitId=field(ParentBusinessUnitId)));
      ExternalName = 'parentbusinessunitidname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(30;Address1_AddressId;GUID)
    {
      ExternalName = 'address1_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 1.';
      Caption = 'Address 1: ID';
    }
    field(31;Address1_AddressTypeCode;Option)
    {
      ExternalName = 'address1_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Type of address for address 1, such as billing, shipping, or primary address.';
      Caption = 'Address 1: Address Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(32;Address1_Name;Text[100])
    {
      ExternalName = 'address1_name';
      ExternalType = 'String';
      Description = 'Name to enter for address 1.';
      Caption = 'Address 1: Name';
    }
    field(33;Address1_Line1;Text[250])
    {
      ExternalName = 'address1_line1';
      ExternalType = 'String';
      Description = 'First line for entering address 1 information.';
      Caption = 'Bill To Street 1';
    }
    field(34;Address1_Line2;Text[250])
    {
      ExternalName = 'address1_line2';
      ExternalType = 'String';
      Description = 'Second line for entering address 1 information.';
      Caption = 'Bill To Street 2';
    }
    field(35;Address1_Line3;Text[250])
    {
      ExternalName = 'address1_line3';
      ExternalType = 'String';
      Description = 'Third line for entering address 1 information.';
      Caption = 'Bill To Street 3';
    }
    field(36;Address1_City;Text[80])
    {
      ExternalName = 'address1_city';
      ExternalType = 'String';
      Description = 'City name for address 1.';
      Caption = 'Bill To City';
    }
    field(37;Address1_StateOrProvince;Text[50])
    {
      ExternalName = 'address1_stateorprovince';
      ExternalType = 'String';
      Description = 'State or province for address 1.';
      Caption = 'Bill To State/Province';
    }
    field(38;Address1_County;Text[50])
    {
      ExternalName = 'address1_county';
      ExternalType = 'String';
      Description = 'County name for address 1.';
      Caption = 'Address 1: County';
    }
    field(39;Address1_Country;Text[80])
    {
      ExternalName = 'address1_country';
      ExternalType = 'String';
      Description = 'Country/region name for address 1.';
      Caption = 'Bill To Country/Region';
    }
    field(40;Address1_PostOfficeBox;Text[20])
    {
      ExternalName = 'address1_postofficebox';
      ExternalType = 'String';
      Description = 'Post office box number for address 1.';
      Caption = 'Address 1: Post Office Box';
    }
    field(41;Address1_PostalCode;Text[20])
    {
      ExternalName = 'address1_postalcode';
      ExternalType = 'String';
      Description = 'ZIP Code or postal code for address 1.';
      Caption = 'Bill To ZIP/Postal Code';
    }
    field(42;Address1_UTCOffset;Integer)
    {
      ExternalName = 'address1_utcoffset';
      ExternalType = 'Integer';
      Description = 'UTC offset for address 1. This is the difference between local time and standard Coordinated Universal Time.';
      Caption = 'Address 1: UTC Offset';
    }
    field(43;Address1_UPSZone;Text[4])
    {
      ExternalName = 'address1_upszone';
      ExternalType = 'String';
      Description = 'United Parcel Service (UPS) zone for address 1.';
      Caption = 'Address 1: UPS Zone';
    }
    field(44;Address1_Latitude;Decimal)
    {
      ExternalName = 'address1_latitude';
      ExternalType = 'Double';
      Description = 'Latitude for address 1.';
      Caption = 'Address 1: Latitude';
    }
    field(45;Address1_Telephone1;Text[50])
    {
      ExternalName = 'address1_telephone1';
      ExternalType = 'String';
      Description = 'First telephone number associated with address 1.';
      Caption = 'Main Phone';
    }
    field(46;Address1_Longitude;Decimal)
    {
      ExternalName = 'address1_longitude';
      ExternalType = 'Double';
      Description = 'Longitude for address 1.';
      Caption = 'Address 1: Longitude';
    }
    field(47;Address1_ShippingMethodCode;Option)
    {
      ExternalName = 'address1_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Method of shipment for address 1.';
      Caption = 'Address 1: Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(48;Address1_Telephone2;Text[50])
    {
      ExternalName = 'address1_telephone2';
      ExternalType = 'String';
      Description = 'Second telephone number associated with address 1.';
      Caption = 'Other Phone';
    }
    field(49;Address1_Telephone3;Text[50])
    {
      ExternalName = 'address1_telephone3';
      ExternalType = 'String';
      Description = 'Third telephone number associated with address 1.';
      Caption = 'Address 1: Telephone 3';
    }
    field(50;Address1_Fax;Text[50])
    {
      ExternalName = 'address1_fax';
      ExternalType = 'String';
      Description = 'Fax number for address 1.';
      Caption = 'Address 1: Fax';
    }
    field(51;Address2_AddressId;GUID)
    {
      ExternalName = 'address2_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 2.';
      Caption = 'Address 2: ID';
    }
    field(52;Address2_AddressTypeCode;Option)
    {
      ExternalName = 'address2_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Type of address for address 2, such as billing, shipping, or primary address.';
      Caption = 'Address 2: Address Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(53;Address2_Name;Text[100])
    {
      ExternalName = 'address2_name';
      ExternalType = 'String';
      Description = 'Name to enter for address 2.';
      Caption = 'Address 2: Name';
    }
    field(54;Address2_Line1;Text[250])
    {
      ExternalName = 'address2_line1';
      ExternalType = 'String';
      Description = 'First line for entering address 2 information.';
      Caption = 'Ship To Street 1';
    }
    field(55;Address2_Line2;Text[250])
    {
      ExternalName = 'address2_line2';
      ExternalType = 'String';
      Description = 'Second line for entering address 2 information.';
      Caption = 'Ship To Street 2';
    }
    field(56;Address2_Line3;Text[250])
    {
      ExternalName = 'address2_line3';
      ExternalType = 'String';
      Description = 'Third line for entering address 2 information.';
      Caption = 'Ship To Street 3';
    }
    field(57;Address2_City;Text[80])
    {
      ExternalName = 'address2_city';
      ExternalType = 'String';
      Description = 'City name for address 2.';
      Caption = 'Ship To City';
    }
    field(58;Address2_StateOrProvince;Text[50])
    {
      ExternalName = 'address2_stateorprovince';
      ExternalType = 'String';
      Description = 'State or province for address 2.';
      Caption = 'Ship To State/Province';
    }
    field(59;Address2_County;Text[50])
    {
      ExternalName = 'address2_county';
      ExternalType = 'String';
      Description = 'County name for address 2.';
      Caption = 'Address 2: County';
    }
    field(60;Address2_Country;Text[80])
    {
      ExternalName = 'address2_country';
      ExternalType = 'String';
      Description = 'Country/region name for address 2.';
      Caption = 'Ship To Country/Region';
    }
    field(61;Address2_PostOfficeBox;Text[20])
    {
      ExternalName = 'address2_postofficebox';
      ExternalType = 'String';
      Description = 'Post office box number for address 2.';
      Caption = 'Address 2: Post Office Box';
    }
    field(62;Address2_PostalCode;Text[20])
    {
      ExternalName = 'address2_postalcode';
      ExternalType = 'String';
      Description = 'ZIP Code or postal code for address 2.';
      Caption = 'Ship To ZIP/Postal Code';
    }
    field(63;Address2_UTCOffset;Integer)
    {
      ExternalName = 'address2_utcoffset';
      ExternalType = 'Integer';
      Description = 'UTC offset for address 2. This is the difference between local time and standard Coordinated Universal Time.';
      Caption = 'Address 2: UTC Offset';
    }
    field(64;Address2_UPSZone;Text[4])
    {
      ExternalName = 'address2_upszone';
      ExternalType = 'String';
      Description = 'United Parcel Service (UPS) zone for address 2.';
      Caption = 'Address 2: UPS Zone';
    }
    field(65;Address2_Latitude;Decimal)
    {
      ExternalName = 'address2_latitude';
      ExternalType = 'Double';
      Description = 'Latitude for address 2.';
      Caption = 'Address 2: Latitude';
    }
    field(66;Address2_Telephone1;Text[50])
    {
      ExternalName = 'address2_telephone1';
      ExternalType = 'String';
      Description = 'First telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 1';
    }
    field(67;Address2_Longitude;Decimal)
    {
      ExternalName = 'address2_longitude';
      ExternalType = 'Double';
      Description = 'Longitude for address 2.';
      Caption = 'Address 2: Longitude';
    }
    field(68;Address2_ShippingMethodCode;Option)
    {
      ExternalName = 'address2_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Method of shipment for address 2.';
      Caption = 'Address 2: Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(69;Address2_Telephone2;Text[50])
    {
      ExternalName = 'address2_telephone2';
      ExternalType = 'String';
      Description = 'Second telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 2';
    }
    field(70;Address2_Telephone3;Text[50])
    {
      ExternalName = 'address2_telephone3';
      ExternalType = 'String';
      Description = 'Third telephone number associated with address 2.';
      Caption = 'Address 2: Telephone 3';
    }
    field(71;Address2_Fax;Text[50])
    {
      ExternalName = 'address2_fax';
      ExternalType = 'String';
      Description = 'Fax number for address 2.';
      Caption = 'Address 2: Fax';
    }
    field(72;CreatedByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(CreatedBy)));
      ExternalName = 'createdbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(74;ModifiedByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(ModifiedBy)));
      ExternalName = 'modifiedbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(84;Picture;BLOB)
    {
      ExternalName = 'picture';
      ExternalType = 'Memo';
      Description = 'Picture or diagram of the business unit.';
      Caption = 'Picture';
      Subtype = Memo;
    }
    field(86;OverriddenCreatedOn;Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
      Caption = 'Record Created On';
    }
    field(87;ImportSequenceNumber;Integer)
    {
      ExternalName = 'importsequencenumber';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the data import or data migration that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(90;CreatedOnBehalfBy;GUID)
    {
      ExternalName = 'createdonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who created the businessunit.';
      Caption = 'Created By (Delegate)';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(92;CreatedOnBehalfByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(CreatedOnBehalfBy)));
      ExternalName = 'createdonbehalfbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(94;ModifiedOnBehalfBy;GUID)
    {
      ExternalName = 'modifiedonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who last modified the businessunit.';
      Caption = 'Modified By (Delegate)';
      TableRelation = "CDS SystemUser".SystemUserId;
    }
    field(96;ModifiedOnBehalfByName;Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS SystemUser".FullName where(SystemUserId=field(ModifiedOnBehalfBy)));
      ExternalName = 'modifiedonbehalfbyname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(100;ExchangeRate;Decimal)
    {
      ExternalName = 'exchangerate';
      ExternalType = 'Decimal';
      ExternalAccess = Read;
      Description = 'Exchange rate for the currency associated with the businessunit with respect to the base currency.';
      Caption = 'Exchange Rate';
    }
  }
  keys
  {
    key(PK;BusinessUnitId)
    {
      Clustered = true;
    }
    key(Name;Name)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(Dropdown;Name)
    {
    }
  }
}