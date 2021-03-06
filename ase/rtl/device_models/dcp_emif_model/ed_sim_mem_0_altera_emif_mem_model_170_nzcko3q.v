// ed_sim_mem_0_altera_emif_mem_model_170_nzcko3q.v

// This file was auto-generated from altera_emif_mem_model_hw.tcl.  If you edit it your changes
// will probably be lost.
//
// Generated using ACDS version 17.0 290

`timescale 1 ps / 1 ps
module ed_sim_mem_0_altera_emif_mem_model_170_nzcko3q (
		input  wire [0:0]  mem_ck,      // mem.mem_ck
		input  wire [0:0]  mem_ck_n,    //    .mem_ck_n
		input  wire [16:0] mem_a,       //    .mem_a
		input  wire [0:0]  mem_act_n,   //    .mem_act_n
		input  wire [1:0]  mem_ba,      //    .mem_ba
		input  wire [1:0]  mem_bg,      //    .mem_bg
		input  wire [0:0]  mem_cke,     //    .mem_cke
		input  wire [0:0]  mem_cs_n,    //    .mem_cs_n
		input  wire [0:0]  mem_odt,     //    .mem_odt
		input  wire [0:0]  mem_reset_n, //    .mem_reset_n
		input  wire [0:0]  mem_par,     //    .mem_par
		output wire [0:0]  mem_alert_n, //    .mem_alert_n
		inout  wire [7:0]  mem_dqs,     //    .mem_dqs
		inout  wire [7:0]  mem_dqs_n,   //    .mem_dqs_n
		inout  wire [63:0] mem_dq,      //    .mem_dq
		inout  wire [7:0]  mem_dbi_n    //    .mem_dbi_n
	);

	altera_emif_ddrx_model #(
		.PROTOCOL_ENUM                     ("PROTOCOL_DDR4"),
		.PHY_PING_PONG_EN                  (0),
		.MEM_FORMAT_ENUM                   ("MEM_FORMAT_DISCRETE"),
		.PORT_MEM_CK_WIDTH                 (1),
		.PORT_MEM_CK_N_WIDTH               (1),
		.PORT_MEM_DK_WIDTH                 (1),
		.PORT_MEM_DK_N_WIDTH               (1),
		.PORT_MEM_DKA_WIDTH                (1),
		.PORT_MEM_DKA_N_WIDTH              (1),
		.PORT_MEM_DKB_WIDTH                (1),
		.PORT_MEM_DKB_N_WIDTH              (1),
		.PORT_MEM_K_WIDTH                  (1),
		.PORT_MEM_K_N_WIDTH                (1),
		.PORT_MEM_A_WIDTH                  (17),
		.PORT_MEM_BA_WIDTH                 (2),
		.PORT_MEM_BG_WIDTH                 (2),
		.PORT_MEM_C_WIDTH                  (1),
		.PORT_MEM_CKE_WIDTH                (1),
		.PORT_MEM_CS_N_WIDTH               (1),
		.PORT_MEM_RM_WIDTH                 (1),
		.PORT_MEM_ODT_WIDTH                (1),
		.PORT_MEM_RAS_N_WIDTH              (1),
		.PORT_MEM_CAS_N_WIDTH              (1),
		.PORT_MEM_WE_N_WIDTH               (1),
		.PORT_MEM_RESET_N_WIDTH            (1),
		.PORT_MEM_ACT_N_WIDTH              (1),
		.PORT_MEM_PAR_WIDTH                (1),
		.PORT_MEM_CA_WIDTH                 (1),
		.PORT_MEM_REF_N_WIDTH              (1),
		.PORT_MEM_WPS_N_WIDTH              (1),
		.PORT_MEM_RPS_N_WIDTH              (1),
		.PORT_MEM_DOFF_N_WIDTH             (1),
		.PORT_MEM_LDA_N_WIDTH              (1),
		.PORT_MEM_LDB_N_WIDTH              (1),
		.PORT_MEM_RWA_N_WIDTH              (1),
		.PORT_MEM_RWB_N_WIDTH              (1),
		.PORT_MEM_LBK0_N_WIDTH             (1),
		.PORT_MEM_LBK1_N_WIDTH             (1),
		.PORT_MEM_CFG_N_WIDTH              (1),
		.PORT_MEM_AP_WIDTH                 (1),
		.PORT_MEM_AINV_WIDTH               (1),
		.PORT_MEM_DM_WIDTH                 (1),
		.PORT_MEM_BWS_N_WIDTH              (1),
		.PORT_MEM_D_WIDTH                  (1),
		.PORT_MEM_DQ_WIDTH                 (64),
		.PORT_MEM_DBI_N_WIDTH              (8),
		.PORT_MEM_DQA_WIDTH                (1),
		.PORT_MEM_DQB_WIDTH                (1),
		.PORT_MEM_DINVA_WIDTH              (1),
		.PORT_MEM_DINVB_WIDTH              (1),
		.PORT_MEM_Q_WIDTH                  (1),
		.PORT_MEM_DQS_WIDTH                (8),
		.PORT_MEM_DQS_N_WIDTH              (8),
		.PORT_MEM_QK_WIDTH                 (1),
		.PORT_MEM_QK_N_WIDTH               (1),
		.PORT_MEM_QKA_WIDTH                (1),
		.PORT_MEM_QKA_N_WIDTH              (1),
		.PORT_MEM_QKB_WIDTH                (1),
		.PORT_MEM_QKB_N_WIDTH              (1),
		.PORT_MEM_CQ_WIDTH                 (1),
		.PORT_MEM_CQ_N_WIDTH               (1),
		.PORT_MEM_ALERT_N_WIDTH            (1),
		.PORT_MEM_PE_N_WIDTH               (1),
		.MEM_DISCRETE_CS_WIDTH             (1),
		.MEM_CHIP_ID_WIDTH                 (0),
		.MEM_ROW_ADDR_WIDTH                (15),
		.MEM_COL_ADDR_WIDTH                (10),
		.MEM_TRTP                          (9),
		.MEM_TRCD                          (15),
		.MEM_RANKS_PER_DIMM                (1),
		.MEM_NUM_OF_DIMMS                  (1),
		.MEM_DM_EN                         (1),
		.MEM_DISCRETE_MIRROR_ADDRESSING_EN (0),
		.MEM_MIRROR_ADDRESSING_EN          (1),
		.MEM_INIT_MRS0                     (0),
		.MEM_INIT_MRS1                     (0),
		.MEM_INIT_MRS2                     (0),
		.MEM_INIT_MRS3                     (0),
		.MEM_CFG_GEN_SBE                   (0),
		.MEM_CFG_GEN_DBE                   (0)
	) core (
		.mem_ck      (mem_ck),      // mem.mem_ck
		.mem_ck_n    (mem_ck_n),    //    .mem_ck_n
		.mem_a       (mem_a),       //    .mem_a
		.mem_act_n   (mem_act_n),   //    .mem_act_n
		.mem_ba      (mem_ba),      //    .mem_ba
		.mem_bg      (mem_bg),      //    .mem_bg
		.mem_cke     (mem_cke),     //    .mem_cke
		.mem_cs_n    (mem_cs_n),    //    .mem_cs_n
		.mem_odt     (mem_odt),     //    .mem_odt
		.mem_reset_n (mem_reset_n), //    .mem_reset_n
		.mem_par     (mem_par),     //    .mem_par
		.mem_alert_n (mem_alert_n), //    .mem_alert_n
		.mem_dqs     (mem_dqs),     //    .mem_dqs
		.mem_dqs_n   (mem_dqs_n),   //    .mem_dqs_n
		.mem_dq      (mem_dq),      //    .mem_dq
		.mem_dbi_n   (mem_dbi_n),   //    .mem_dbi_n
		.mem_c       (1'b0),        // (terminated)
		.mem_rm      (1'b0),        // (terminated)
		.mem_dk      (1'b0),        // (terminated)
		.mem_dk_n    (1'b0),        // (terminated)
		.mem_dka     (1'b0),        // (terminated)
		.mem_dka_n   (1'b0),        // (terminated)
		.mem_dkb     (1'b0),        // (terminated)
		.mem_dkb_n   (1'b0),        // (terminated)
		.mem_k       (1'b0),        // (terminated)
		.mem_k_n     (1'b0),        // (terminated)
		.mem_ras_n   (1'b0),        // (terminated)
		.mem_cas_n   (1'b0),        // (terminated)
		.mem_we_n    (1'b0),        // (terminated)
		.mem_ca      (1'b0),        // (terminated)
		.mem_ref_n   (1'b0),        // (terminated)
		.mem_wps_n   (1'b0),        // (terminated)
		.mem_rps_n   (1'b0),        // (terminated)
		.mem_doff_n  (1'b0),        // (terminated)
		.mem_lda_n   (1'b0),        // (terminated)
		.mem_ldb_n   (1'b0),        // (terminated)
		.mem_rwa_n   (1'b0),        // (terminated)
		.mem_rwb_n   (1'b0),        // (terminated)
		.mem_lbk0_n  (1'b0),        // (terminated)
		.mem_lbk1_n  (1'b0),        // (terminated)
		.mem_cfg_n   (1'b0),        // (terminated)
		.mem_ap      (1'b0),        // (terminated)
		.mem_ainv    (1'b0),        // (terminated)
		.mem_dm      (1'b0),        // (terminated)
		.mem_bws_n   (1'b0),        // (terminated)
		.mem_d       (1'b0),        // (terminated)
		.mem_dqa     (),            // (terminated)
		.mem_dqb     (),            // (terminated)
		.mem_dinva   (),            // (terminated)
		.mem_dinvb   (),            // (terminated)
		.mem_q       (),            // (terminated)
		.mem_qk      (),            // (terminated)
		.mem_qk_n    (),            // (terminated)
		.mem_qka     (),            // (terminated)
		.mem_qka_n   (),            // (terminated)
		.mem_qkb     (),            // (terminated)
		.mem_qkb_n   (),            // (terminated)
		.mem_cq      (),            // (terminated)
		.mem_cq_n    (),            // (terminated)
		.mem_pe_n    ()             // (terminated)
	);

endmodule
