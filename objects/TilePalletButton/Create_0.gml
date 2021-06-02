/// @description Set-up variables and randomise content

#macro ButtonState_None "None"
#macro ButtonState_Hover "Hover"
#macro ButtonState_Active "Active"

Position = -1;

Content = ds_map_create();

PopulateRandomContent(Content);
