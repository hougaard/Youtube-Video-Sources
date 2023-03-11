tableextension 51200 "My G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(51200; AccountingPeriod; Integer)
        {
            Caption = 'Account Period';
        }
    }
    keys
    {
        key(AP; AccountingPeriod)
        {
        }
    }
}