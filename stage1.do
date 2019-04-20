vsim -gui work.stageone
# vsim 
# Start time: 09:13:28 on Apr 20,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.stageone(fetch)
# //  ModelSim PE Student Edition 10.4a Apr  7 2015 
# //
# //  Copyright 1991-2015 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# //  WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
# //  LICENSORS AND IS SUBJECT TO LICENSE TERMS.
# //  THIS DOCUMENT CONTAINS TRADE SECRETS AND COMMERCIAL OR FINANCIAL
# //  INFORMATION THAT ARE PRIVILEGED, CONFIDENTIAL, AND EXEMPT FROM
# //  DISCLOSURE UNDER THE FREEDOM OF INFORMATION ACT, 5 U.S.C. SECTION 552.
# //  FURTHERMORE, THIS INFORMATION IS PROHIBITED FROM DISCLOSURE UNDER
# //  THE TRADE SECRETS ACT, 18 U.S.C. SECTION 1905.
# //
# // NOT FOR CORPORATE OR PRODUCTION USE.
# // THE ModelSim PE Student Edition IS NOT A SUPPORTED PRODUCT.
# // FOR HIGHER EDUCATION PURPOSES ONLY
# //
# vsim -gui 
# Start time: 09:08:22 on Apr 20,2019
# ** WARNING: ModelSim PE Student Edition license key will expire as of (null).
#   Please go to http://www.model.com and download the ModelSim PE Student Edition update.
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.stageone(fetch)
add wave -position insertpoint sim:/stageone/*
force -freeze sim:/stageone/rst 1 0
force -freeze sim:/stageone/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/stageone/start 0 0
run
force -freeze sim:/stageone/A 8'hAA 0
force -freeze sim:/stageone/B 4'h3 0
run
force -freeze sim:/stageone/rst 0 0
run
force -freeze sim:/stageone/start 1 0
run
force -freeze sim:/stageone/B 4'h8 0
run