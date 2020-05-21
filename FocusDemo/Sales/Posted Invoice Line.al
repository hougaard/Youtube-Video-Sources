tableextension 72102 "P. Sales Line Focus" extends "Sales Invoice Line"
{
    fields
    {
        field(72100; "User Count"; Integer)
        {
            Caption = 'User Count';
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(72101; "Start Date"; Date)
        {
            Caption = 'Subscription Start';
            DataClassification = ToBeClassified;
        }
        field(72102; "End Date"; Date)
        {
            Caption = 'Subscription End';
            DataClassification = ToBeClassified;
        }
    }
}