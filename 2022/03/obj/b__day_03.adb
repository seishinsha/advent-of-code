pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__day_03.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__day_03.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E014 : Short_Integer; pragma Import (Ada, E014, "ada__exceptions_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__soft_links_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "system__exception_table_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__exceptions_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__soft_links__initialize_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__containers_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__io_exceptions_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__strings_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "interfaces__c_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "system__os_lib_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__tags_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__streams_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__file_control_block_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__finalization_root_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__finalization_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__file_io_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "system__storage_pools_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "system__finalization_masters_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__storage_pools__subpools_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "ada__real_time_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "ada__text_io_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "ada__strings__maps_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__pool_global_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__tasking__initialization_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__tasking__protected_objects_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "system__tasking__protected_objects__entries_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__tasking__queuing_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__tasking__stages_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E171 := E171 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E110 := E110 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__pool_global__finalize_spec");
      begin
         F2;
      end;
      E088 := E088 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      E114 := E114 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__storage_pools__subpools__finalize_spec");
      begin
         F4;
      end;
      E102 := E102 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__finalization_masters__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__file_io__finalize_body");
      begin
         E093 := E093 - 1;
         F6;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, False, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           False, False, False, True, False, False, True, False, 
           True, False, False, True, False, False, False, True, 
           False, False, True, True, False, True, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False),
         Count => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, False, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E008 := E008 + 1;
      System.Exceptions'Elab_Spec;
      E018 := E018 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E049 := E049 + 1;
      E010 := E010 + 1;
      E014 := E014 + 1;
      Ada.Containers'Elab_Spec;
      E005 := E005 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E057 := E057 + 1;
      Ada.Strings'Elab_Spec;
      E076 := E076 + 1;
      Interfaces.C'Elab_Spec;
      E131 := E131 + 1;
      System.Os_Lib'Elab_Body;
      E095 := E095 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E059 := E059 + 1;
      Ada.Streams'Elab_Spec;
      E056 := E056 + 1;
      System.File_Control_Block'Elab_Spec;
      E098 := E098 + 1;
      System.Finalization_Root'Elab_Spec;
      E072 := E072 + 1;
      Ada.Finalization'Elab_Spec;
      E054 := E054 + 1;
      System.File_Io'Elab_Body;
      E093 := E093 + 1;
      System.Storage_Pools'Elab_Spec;
      E108 := E108 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E102 := E102 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E114 := E114 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E181 := E181 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E088 := E088 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E080 := E080 + 1;
      System.Pool_Global'Elab_Spec;
      E110 := E110 + 1;
      System.Tasking.Initialization'Elab_Body;
      E159 := E159 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E169 := E169 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E171 := E171 + 1;
      System.Tasking.Queuing'Elab_Body;
      E167 := E167 + 1;
      System.Tasking.Stages'Elab_Body;
      E155 := E155 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_day_03");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /Users/flintstone/adventOfCode/2022/03/obj/day_03.o
   --   -L/Users/flintstone/adventOfCode/2022/03/obj/
   --   -L/Users/flintstone/adventOfCode/2022/03/obj/
   --   -L/users/flintstone/opt/gnat/2020/lib/gcc/x86_64-apple-darwin17.7.0/8.4.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
