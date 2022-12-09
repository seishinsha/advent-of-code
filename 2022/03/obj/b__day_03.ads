pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2020 (20200818-84)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_day_03" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#54e2e235#;
   pragma Export (C, u00001, "day_03B");
   u00002 : constant Version_32 := 16#67c8d842#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#6dba5b66#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00005, "ada__containersS");
   u00006 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#37322c0b#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#776ed810#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#632dfee6#;
   pragma Export (C, u00011, "system__secondary_stackB");
   u00012 : constant Version_32 := 16#f9f0587f#;
   pragma Export (C, u00012, "system__secondary_stackS");
   u00013 : constant Version_32 := 16#ba5b22d1#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#f540b206#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#35e1815f#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#cfec26ee#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00017, "system__exceptionsB");
   u00018 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00018, "system__exceptionsS");
   u00019 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00019, "system__exceptions__machineB");
   u00020 : constant Version_32 := 16#5c74e542#;
   pragma Export (C, u00020, "system__exceptions__machineS");
   u00021 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00021, "system__exceptions_debugB");
   u00022 : constant Version_32 := 16#1416bc8d#;
   pragma Export (C, u00022, "system__exceptions_debugS");
   u00023 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00023, "system__img_intB");
   u00024 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00024, "system__img_intS");
   u00025 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00025, "system__storage_elementsB");
   u00026 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00026, "system__storage_elementsS");
   u00027 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00027, "system__tracebackB");
   u00028 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00028, "system__tracebackS");
   u00029 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00029, "system__traceback_entriesB");
   u00030 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00030, "system__traceback_entriesS");
   u00031 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00031, "system__traceback__symbolicB");
   u00032 : constant Version_32 := 16#46491211#;
   pragma Export (C, u00032, "system__traceback__symbolicS");
   u00033 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00033, "ada__exceptions__tracebackB");
   u00034 : constant Version_32 := 16#ae2d2db5#;
   pragma Export (C, u00034, "ada__exceptions__tracebackS");
   u00035 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00035, "system__address_imageB");
   u00036 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00036, "system__address_imageS");
   u00037 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00037, "system__wch_conB");
   u00038 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00038, "system__wch_conS");
   u00039 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00039, "system__wch_stwB");
   u00040 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00040, "system__wch_stwS");
   u00041 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00041, "system__wch_cnvB");
   u00042 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00042, "system__wch_cnvS");
   u00043 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00044, "system__wch_jisB");
   u00045 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00045, "system__wch_jisS");
   u00046 : constant Version_32 := 16#896564a3#;
   pragma Export (C, u00046, "system__parametersB");
   u00047 : constant Version_32 := 16#4f09ab30#;
   pragma Export (C, u00047, "system__parametersS");
   u00048 : constant Version_32 := 16#ce3e0e21#;
   pragma Export (C, u00048, "system__soft_links__initializeB");
   u00049 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00049, "system__soft_links__initializeS");
   u00050 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00050, "system__stack_checkingB");
   u00051 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00051, "system__stack_checkingS");
   u00052 : constant Version_32 := 16#c89f77d5#;
   pragma Export (C, u00052, "ada__containers__helpersB");
   u00053 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00053, "ada__containers__helpersS");
   u00054 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00054, "ada__finalizationS");
   u00055 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00055, "ada__streamsB");
   u00056 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00056, "ada__streamsS");
   u00057 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00057, "ada__io_exceptionsS");
   u00058 : constant Version_32 := 16#f9576a72#;
   pragma Export (C, u00058, "ada__tagsB");
   u00059 : constant Version_32 := 16#b6661f55#;
   pragma Export (C, u00059, "ada__tagsS");
   u00060 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00060, "system__htableB");
   u00061 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00061, "system__htableS");
   u00062 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00062, "system__string_hashB");
   u00063 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00063, "system__string_hashS");
   u00064 : constant Version_32 := 16#56941de9#;
   pragma Export (C, u00064, "system__unsigned_typesS");
   u00065 : constant Version_32 := 16#d2ae2792#;
   pragma Export (C, u00065, "system__val_lluB");
   u00066 : constant Version_32 := 16#3b5a900b#;
   pragma Export (C, u00066, "system__val_lluS");
   u00067 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00067, "system__val_utilB");
   u00068 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00068, "system__val_utilS");
   u00069 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00069, "system__case_utilB");
   u00070 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00070, "system__case_utilS");
   u00071 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00071, "system__finalization_rootB");
   u00072 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00072, "system__finalization_rootS");
   u00073 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00073, "system__atomic_countersB");
   u00074 : constant Version_32 := 16#bc074276#;
   pragma Export (C, u00074, "system__atomic_countersS");
   u00075 : constant Version_32 := 16#8225628b#;
   pragma Export (C, u00075, "ada__containers__red_black_treesS");
   u00076 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00076, "ada__stringsS");
   u00077 : constant Version_32 := 16#97ae1e3d#;
   pragma Export (C, u00077, "ada__strings__fixedB");
   u00078 : constant Version_32 := 16#fec1aafc#;
   pragma Export (C, u00078, "ada__strings__fixedS");
   u00079 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00079, "ada__strings__mapsB");
   u00080 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00080, "ada__strings__mapsS");
   u00081 : constant Version_32 := 16#7ca1465f#;
   pragma Export (C, u00081, "system__bit_opsB");
   u00082 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00082, "system__bit_opsS");
   u00083 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00083, "ada__charactersS");
   u00084 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00084, "ada__characters__latin_1S");
   u00085 : constant Version_32 := 16#2eb48a6d#;
   pragma Export (C, u00085, "ada__strings__searchB");
   u00086 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00086, "ada__strings__searchS");
   u00087 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00087, "ada__text_ioB");
   u00088 : constant Version_32 := 16#3913d0d6#;
   pragma Export (C, u00088, "ada__text_ioS");
   u00089 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00089, "interfaces__c_streamsB");
   u00090 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00090, "interfaces__c_streamsS");
   u00091 : constant Version_32 := 16#41b27041#;
   pragma Export (C, u00091, "system__crtlS");
   u00092 : constant Version_32 := 16#ec9c64c3#;
   pragma Export (C, u00092, "system__file_ioB");
   u00093 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00093, "system__file_ioS");
   u00094 : constant Version_32 := 16#5f851299#;
   pragma Export (C, u00094, "system__os_libB");
   u00095 : constant Version_32 := 16#d872da39#;
   pragma Export (C, u00095, "system__os_libS");
   u00096 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00096, "system__stringsB");
   u00097 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00097, "system__stringsS");
   u00098 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00098, "system__file_control_blockS");
   u00099 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00099, "system__concat_2B");
   u00100 : constant Version_32 := 16#0afbb82b#;
   pragma Export (C, u00100, "system__concat_2S");
   u00101 : constant Version_32 := 16#57674f80#;
   pragma Export (C, u00101, "system__finalization_mastersB");
   u00102 : constant Version_32 := 16#0b3c2f2b#;
   pragma Export (C, u00102, "system__finalization_mastersS");
   u00103 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00103, "system__img_boolB");
   u00104 : constant Version_32 := 16#fd821e10#;
   pragma Export (C, u00104, "system__img_boolS");
   u00105 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00105, "system__ioB");
   u00106 : constant Version_32 := 16#961998b4#;
   pragma Export (C, u00106, "system__ioS");
   u00107 : constant Version_32 := 16#35d6ef80#;
   pragma Export (C, u00107, "system__storage_poolsB");
   u00108 : constant Version_32 := 16#732d884c#;
   pragma Export (C, u00108, "system__storage_poolsS");
   u00109 : constant Version_32 := 16#021224f8#;
   pragma Export (C, u00109, "system__pool_globalB");
   u00110 : constant Version_32 := 16#29da5924#;
   pragma Export (C, u00110, "system__pool_globalS");
   u00111 : constant Version_32 := 16#eca5ecae#;
   pragma Export (C, u00111, "system__memoryB");
   u00112 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00112, "system__memoryS");
   u00113 : constant Version_32 := 16#d5d8c501#;
   pragma Export (C, u00113, "system__storage_pools__subpoolsB");
   u00114 : constant Version_32 := 16#e136d7bf#;
   pragma Export (C, u00114, "system__storage_pools__subpoolsS");
   u00115 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00115, "system__storage_pools__subpools__finalizationB");
   u00116 : constant Version_32 := 16#8bd8fdc9#;
   pragma Export (C, u00116, "system__storage_pools__subpools__finalizationS");
   u00117 : constant Version_32 := 16#5252521d#;
   pragma Export (C, u00117, "system__stream_attributesB");
   u00118 : constant Version_32 := 16#d573b948#;
   pragma Export (C, u00118, "system__stream_attributesS");
   u00119 : constant Version_32 := 16#3e25f63c#;
   pragma Export (C, u00119, "system__stream_attributes__xdrB");
   u00120 : constant Version_32 := 16#2f60cd1f#;
   pragma Export (C, u00120, "system__stream_attributes__xdrS");
   u00121 : constant Version_32 := 16#502e73ef#;
   pragma Export (C, u00121, "system__fat_fltS");
   u00122 : constant Version_32 := 16#761c7ae2#;
   pragma Export (C, u00122, "system__fat_lfltS");
   u00123 : constant Version_32 := 16#0cccd408#;
   pragma Export (C, u00123, "system__fat_llfS");
   u00124 : constant Version_32 := 16#a368b3ae#;
   pragma Export (C, u00124, "system__fat_sfltS");
   u00125 : constant Version_32 := 16#c809f030#;
   pragma Export (C, u00125, "system__taskingB");
   u00126 : constant Version_32 := 16#848e268f#;
   pragma Export (C, u00126, "system__taskingS");
   u00127 : constant Version_32 := 16#fde20231#;
   pragma Export (C, u00127, "system__task_primitivesS");
   u00128 : constant Version_32 := 16#352452d1#;
   pragma Export (C, u00128, "system__os_interfaceB");
   u00129 : constant Version_32 := 16#863b4995#;
   pragma Export (C, u00129, "system__os_interfaceS");
   u00130 : constant Version_32 := 16#e49bce3e#;
   pragma Export (C, u00130, "interfaces__cB");
   u00131 : constant Version_32 := 16#dbc36ce0#;
   pragma Export (C, u00131, "interfaces__cS");
   u00132 : constant Version_32 := 16#f6a874ae#;
   pragma Export (C, u00132, "interfaces__c__extensionsS");
   u00133 : constant Version_32 := 16#8788e4d2#;
   pragma Export (C, u00133, "system__os_constantsS");
   u00134 : constant Version_32 := 16#7e77a953#;
   pragma Export (C, u00134, "system__task_primitives__operationsB");
   u00135 : constant Version_32 := 16#54ffbebe#;
   pragma Export (C, u00135, "system__task_primitives__operationsS");
   u00136 : constant Version_32 := 16#89b55e64#;
   pragma Export (C, u00136, "system__interrupt_managementB");
   u00137 : constant Version_32 := 16#887626f9#;
   pragma Export (C, u00137, "system__interrupt_managementS");
   u00138 : constant Version_32 := 16#64507e17#;
   pragma Export (C, u00138, "system__multiprocessorsB");
   u00139 : constant Version_32 := 16#30f7f088#;
   pragma Export (C, u00139, "system__multiprocessorsS");
   u00140 : constant Version_32 := 16#2b2125d3#;
   pragma Export (C, u00140, "system__os_primitivesB");
   u00141 : constant Version_32 := 16#0fa60a0d#;
   pragma Export (C, u00141, "system__os_primitivesS");
   u00142 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00142, "system__task_infoB");
   u00143 : constant Version_32 := 16#8841d2fa#;
   pragma Export (C, u00143, "system__task_infoS");
   u00144 : constant Version_32 := 16#83ab03df#;
   pragma Export (C, u00144, "system__tasking__debugB");
   u00145 : constant Version_32 := 16#de1ac8b1#;
   pragma Export (C, u00145, "system__tasking__debugS");
   u00146 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00146, "system__concat_3B");
   u00147 : constant Version_32 := 16#032b335e#;
   pragma Export (C, u00147, "system__concat_3S");
   u00148 : constant Version_32 := 16#b31a5821#;
   pragma Export (C, u00148, "system__img_enum_newB");
   u00149 : constant Version_32 := 16#6917693b#;
   pragma Export (C, u00149, "system__img_enum_newS");
   u00150 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00150, "system__img_lliB");
   u00151 : constant Version_32 := 16#19143a2a#;
   pragma Export (C, u00151, "system__img_lliS");
   u00152 : constant Version_32 := 16#617d5887#;
   pragma Export (C, u00152, "system__stack_usageB");
   u00153 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00153, "system__stack_usageS");
   u00154 : constant Version_32 := 16#20236a91#;
   pragma Export (C, u00154, "system__tasking__stagesB");
   u00155 : constant Version_32 := 16#81567080#;
   pragma Export (C, u00155, "system__tasking__stagesS");
   u00156 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00156, "system__restrictionsB");
   u00157 : constant Version_32 := 16#e13231fb#;
   pragma Export (C, u00157, "system__restrictionsS");
   u00158 : constant Version_32 := 16#ec943981#;
   pragma Export (C, u00158, "system__tasking__initializationB");
   u00159 : constant Version_32 := 16#cd0eb8a9#;
   pragma Export (C, u00159, "system__tasking__initializationS");
   u00160 : constant Version_32 := 16#e4414fdd#;
   pragma Export (C, u00160, "system__soft_links__taskingB");
   u00161 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00161, "system__soft_links__taskingS");
   u00162 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00162, "ada__exceptions__is_null_occurrenceB");
   u00163 : constant Version_32 := 16#6fde25af#;
   pragma Export (C, u00163, "ada__exceptions__is_null_occurrenceS");
   u00164 : constant Version_32 := 16#1285a074#;
   pragma Export (C, u00164, "system__tasking__task_attributesB");
   u00165 : constant Version_32 := 16#7dbadc03#;
   pragma Export (C, u00165, "system__tasking__task_attributesS");
   u00166 : constant Version_32 := 16#1e2f902a#;
   pragma Export (C, u00166, "system__tasking__queuingB");
   u00167 : constant Version_32 := 16#73e13001#;
   pragma Export (C, u00167, "system__tasking__queuingS");
   u00168 : constant Version_32 := 16#ffeb88b5#;
   pragma Export (C, u00168, "system__tasking__protected_objectsB");
   u00169 : constant Version_32 := 16#242da0e0#;
   pragma Export (C, u00169, "system__tasking__protected_objectsS");
   u00170 : constant Version_32 := 16#d486da22#;
   pragma Export (C, u00170, "system__tasking__protected_objects__entriesB");
   u00171 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00171, "system__tasking__protected_objects__entriesS");
   u00172 : constant Version_32 := 16#b7f86010#;
   pragma Export (C, u00172, "system__tasking__rendezvousB");
   u00173 : constant Version_32 := 16#e93c6c5f#;
   pragma Export (C, u00173, "system__tasking__rendezvousS");
   u00174 : constant Version_32 := 16#89ce3912#;
   pragma Export (C, u00174, "system__tasking__entry_callsB");
   u00175 : constant Version_32 := 16#526fb901#;
   pragma Export (C, u00175, "system__tasking__entry_callsS");
   u00176 : constant Version_32 := 16#6848313e#;
   pragma Export (C, u00176, "system__tasking__protected_objects__operationsB");
   u00177 : constant Version_32 := 16#343fde45#;
   pragma Export (C, u00177, "system__tasking__protected_objects__operationsS");
   u00178 : constant Version_32 := 16#d88190b7#;
   pragma Export (C, u00178, "system__tasking__utilitiesB");
   u00179 : constant Version_32 := 16#3e4ab368#;
   pragma Export (C, u00179, "system__tasking__utilitiesS");
   u00180 : constant Version_32 := 16#90272385#;
   pragma Export (C, u00180, "ada__real_timeB");
   u00181 : constant Version_32 := 16#1ad7dfc0#;
   pragma Export (C, u00181, "ada__real_timeS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.memory%s
   --  system.memory%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.containers%s
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  interfaces.c.extensions%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.fat_sflt%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  ada.containers.red_black_trees%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  day_03%b
   --  END ELABORATION ORDER

end ada_main;
