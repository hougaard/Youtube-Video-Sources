// permissionset 57100 "Point Of Sale Admin"
// {
//     Caption = 'Point of sale admin';
//     Access = Public;
//     Assignable = true;
//     IncludedPermissionSets = "POS Setup (Admin)";
// }

// permissionset 57101 "POS Setup (Admin)"
// {
//     Caption = 'POS Setup Admin';
//     Access = Internal;
//     Permissions = tabledata "POS Setup" = RIMD,
//                   tabledata "General Ledger Setup" = RIMD;
// }

// permissionset 57102 "Point Of Sale User"
// {
//     Caption = 'Point of sale user';
//     Access = Public;
//     Assignable = true;
//     IncludedPermissionSets = "POS Setup (read)";
// }

// permissionset 57103 "POS Setup (read)"
// {
//     Caption = 'POS Setup Read';
//     Access = Internal;
//     IncludedPermissionSets = "POS G/L";
//     Permissions = tabledata "POS Setup" = R;
// }

// permissionset 57104 "POS G/L"
// {
//     Caption = 'POS GL';
//     Access = Internal;
//     Permissions = tabledata "General Ledger Setup" = R;
// }
