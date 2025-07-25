%% ICORR_Condition_02 Rotation Matrix Force Transormation
%% Script to verify if the unit vector from the MoBL.osim file are what we think they are %%
%% Starting the rotational chain from ground-thorax-clavicle-
clear all;
clc;
dr = HelperDrawRotation;
%% <Body name="thorax">, <CustomJoint name="groundthorax">
axangGT = [0 1 0 -1.57079632294392];
rotmGT = axang2rotm(axangGT);
%% <Body name="clavicle_r">, <CustomJoint name="sternoclavicular_r">
axangSC_r2 = [0.0153 0.9892987 -0.14509996 -0.380133562537734];
rotmSC_r2 = axang2rotm(axangSC_r2);
axangSC_r3 = [-0.99447254 0 -0.10499695 0.161006635764426];
rotmSC_r3 = axang2rotm(axangSC_r3);
rotmSC = rotmSC_r2 * rotmSC_r3;
%% <Body name="clavphant_r">, <CustomJoint name="unrotscap_r">
axangCC_r3 = [-0.99447254 0 -0.10499695 -0.161006635764426];
rotmCC_r3 = axang2rotm(axangCC_r3);
axangCC_r2 = [0.0153 0.9892987 -0.14509996 0.380133562537734];
rotmCC_r2 = axang2rotm(axangCC_r2);
rotmCC = rotmCC_r3 * rotmCC_r2;
%% <Body name="scapula_r">, <CustomJoint name="acromioclavicular_r">
axangCS_r2 = [0.15709493 0.94726859 -0.27929088 -0.0769693139024482];
rotmCS_r2 = axang2rotm(axangCS_r2);
axangCS_r3 = [-0.75408404 0.29759402 0.58548703 0.62203892051952];
rotmCS_r3 = axang2rotm(axangCS_r3);
axangCS_r1 = [0.63769985 0.11859997 0.76109982 0.279602213767189];
rotmCS_r1 = axang2rotm(axangCS_r1);
rotmCS = rotmCS_r2 * rotmCS_r3 * rotmCS_r1;
%% <Body name="scapphant_r">, <CustomJoint name="unrothum_r">
axangSS_r1 = [0.63769985 0.11859997 0.76109982 -0.279602213767189];
rotmSS_r1 = axang2rotm(axangSS_r1);
axangSS_r3 = [-0.75408404 0.29759402 0.58548703 -0.62203892051952];
rotmSS_r3 = axang2rotm(axangSS_r3);
axangSS_r2 = [0.15709493 0.94726859 -0.27929088 0.0769693139024482];
rotmSS_r2= axang2rotm(axangSS_r2);
rotmSS = rotmSS_r1 * rotmSS_r3 * rotmSS_r2;
%% <Body name="humphant_r">, <CustomJoint name="shoulder0_r">, <Coordinate name="elv_angle_r">, *clamped, ???
axangSH_elvAng = [0.0048 0.99908918 0.04240001 1.52716311226275];
rotmSH_elvAng= axang2rotm(axangSH_elvAng);
rotmSH = rotmSH_elvAng;
%% <Body name="humphant1_r">, <CustomJoint name="shoulder1_r">, <Coordinate name="shoulder_elv_r">, *clamped, 3 degrees.
axangSH1_shElv = [-0.99826136 0.0023 0.05889802 1.57079632453088];
rotmSH1_shElv= axang2rotm(axangSH1_shElv);
axangSH1_r2 = [0.0048 0.99908918 0.04240001 -1.52716311226275];
rotmSH1_r2= axang2rotm(axangSH1_r2);
rotmSH1 = rotmSH1_shElv * rotmSH1_r2;
%% Humerous is the same orientation as humpphant1_r
axangSH2_shRot = [0.0048 0.99908918 0.04240001 0.698131702631406];
rotmSH2_shRot= axang2rotm(axangSH2_shRot);
rotmSH2 = rotmSH2_shRot;
%% <Body name="ulna_r">, <CustomJoint name="elbow_r">, <Coordinate name="elbow_flexion_r">
axangHU_elbFl = [0.04940001 0.03660001 0.99810825 0.000140200204672955];
rotmHU_elbFl= axang2rotm(axangHU_elbFl);
rotmHU = rotmHU_elbFl;
%% <Body name="radius_r">, <CustomJoint name="radioulnar_r">, <Coordinate name="pro_sup_r">
axangUR_proSup = [-0.01716099 0.99266564 -0.11966796 -0.340077405252741];
rotmUR_proSup= axang2rotm(axangUR_proSup);
rotmUR = rotmUR_proSup;
%% <Body name="proximal_row_r">, <CustomJoint name="radiocarpal_r">, <Coordinate name="deviation_r"> & (<Coordinate name="flexion_r"><default_value>-0.511381436543561</default_value>)
axangRP_dev = [-0.819064 -0.135611 -0.557444 0.0206996245082191];
rotmRP_dev= axang2rotm(axangRP_dev);
% <function>
% 										<SimmSpline>
% 											<x> -0.174533 0 0.436332</x>
% 											<y> -0.174533 0 0.436332</y>
% 										</SimmSpline>
% 									</function>
axangRP_flx = [0.95642673 -0.25220693 0.14710396 -0.264504657254823];
rotmRP_flx= axang2rotm(axangRP_flx);
%<function>
% 										<SimmSpline>
% 											<x> -1.5708 1.5708</x>
% 											<y> -0.785398 0.785398</y>
% 										</SimmSpline>
% 									</function>
rotmRP = rotmRP_dev * rotmRP_flx;
%% <Body name="hand_r">, <CustomJoint name="wrist_hand_r">, <Coordinate name="wrist_hand_r">
axangPrH_r1 = [0.8991357 -0.34905288 -0.26403991 0.0277415935292925];
rotmPrH_r1= axang2rotm(axangPrH_r1);
axangPrH_r3 = [0.99711853 0.01069999 -0.07510096 -0.132252328627412];
rotmPrH_r3= axang2rotm(axangPrH_r3);
rotmPrH = rotmPrH_r1 * rotmPrH_r3;
%%
rotationAxisMatrix = rotmGT * rotmSC * rotmCC * rotmCS * rotmSS * rotmSH * rotmSH1 * rotmSH2 * rotmHU *rotmUR * rotmRP * rotmPrH
invTransRotAxMatrix = (inv(rotationAxisMatrix))'
%% Pose plots to validate frame rotations
fixedCoordSys = rotm2eul(rotationAxisMatrix)
figure
dr.drawEulerRotation(gca, rad2deg(fixedCoordSys))
figure
fixedCoordSys1 = rotm2eul(invTransRotAxMatrix)
dr.drawEulerRotation(gca, rad2deg(fixedCoordSys1))
%% Apply rotation matrix to offset force data from .mot file
forceOffset = readmatrix("external_force_offset_02_01_01");
f_xyz_local_02 = forceOffset(:,2:4);
f_rotMatrix_02 = f_xyz_local_02 * rotationAxisMatrix;
writematrix(f_rotMatrix_02, "external_force_rotMatrix_02_02_01")
f_startRotMatrix_02 = readmatrix("external_force_rotMatrix_02_02_01.txt");
f_transInvRotMatrix_02 = f_xyz_local_02 * (inv(rotationAxisMatrix))';
writematrix(f_transInvRotMatrix_02, "external_force_transInvRotMatrix_02_02_01")
f_startTransInv_02 = readmatrix("external_force_transInvRotMatrix_02_02_01.txt");
f_x_transInvRotationMatrixEnd_02 = f_startTransInv_02(:,1);
f_y_transInvRotationMatrixEnd_02 = f_startTransInv_02(:,2);
f_z_transInvRotationMatrixEnd_02 = f_startTransInv_02(:,3);
f_x_RotMatrixEnd_02 = f_startRotMatrix_02(:,1);
f_y_RotMatrixEnd_02 = f_startRotMatrix_02(:,2);
f_z_RotMatrixEnd_02 = f_startRotMatrix_02(:,3);