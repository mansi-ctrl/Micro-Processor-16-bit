/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003015065487_3715546195_init();
    work_m_00000000002002155427_2725559894_init();
    work_m_00000000003786725392_1345475044_init();
    work_m_00000000000056802400_1604772254_init();
    work_m_00000000001664313865_2835344150_init();
    work_m_00000000001143682889_0135173930_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001143682889_0135173930");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
