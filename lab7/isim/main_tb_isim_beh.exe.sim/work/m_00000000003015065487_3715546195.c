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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "F:/sem3/COLab/lab7/GCD.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_54_0(char *t0)
{
    char t6[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2408);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 2088);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);
    xsi_set_current_line(59, ng0);

LAB6:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 4294967295U);
    if (t11 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t5) == 0)
        goto LAB7;

LAB9:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;

LAB10:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t6);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 16);
    goto LAB2;

LAB7:    *((unsigned int *)t6) = 1;
    goto LAB10;

LAB11:    xsi_set_current_line(60, ng0);

LAB13:    xsi_set_current_line(61, ng0);
    t19 = (t0 + 1928);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t0 + 2088);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memset(t25, 0, 8);
    t26 = (t21 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB15;

LAB14:    t27 = (t24 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB15;

LAB18:    if (*((unsigned int *)t21) < *((unsigned int *)t24))
        goto LAB16;

LAB17:    t29 = (t25 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t25);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t12 = (t4 + 4);
    t13 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = *((unsigned int *)t5);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t30 = (~(t18));
    t31 = (t15 & t30);
    if (t31 != 0)
        goto LAB24;

LAB23:    if (t18 != 0)
        goto LAB25;

LAB26:    t20 = (t6 + 4);
    t32 = *((unsigned int *)t20);
    t33 = (~(t32));
    t34 = *((unsigned int *)t6);
    t39 = (t34 & t33);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(69, ng0);

LAB31:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB29:
LAB21:    goto LAB6;

LAB15:    t28 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB17;

LAB16:    *((unsigned int *)t25) = 1;
    goto LAB17;

LAB19:    xsi_set_current_line(61, ng0);

LAB22:    xsi_set_current_line(62, ng0);
    t35 = (t0 + 1928);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t0 + 2248);
    xsi_vlogvar_assign_value(t38, t37, 0, 0, 16);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1928);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 16);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 16);
    goto LAB21;

LAB24:    *((unsigned int *)t6) = 1;
    goto LAB26;

LAB25:    t19 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(66, ng0);

LAB30:    xsi_set_current_line(67, ng0);
    t21 = (t0 + 1928);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t0 + 2088);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t23, 16, t27, 16);
    t28 = (t0 + 1928);
    xsi_vlogvar_assign_value(t28, t25, 0, 0, 16);
    goto LAB29;

}


extern void work_m_00000000003015065487_3715546195_init()
{
	static char *pe[] = {(void *)Always_54_0};
	xsi_register_didat("work_m_00000000003015065487_3715546195", "isim/main_tb_isim_beh.exe.sim/work/m_00000000003015065487_3715546195.didat");
	xsi_register_executes(pe);
}
