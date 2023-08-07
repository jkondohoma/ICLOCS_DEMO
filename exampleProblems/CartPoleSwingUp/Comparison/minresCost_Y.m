% This code was generated using ADiGator version 1.4
% ©2010-2014 Matthew J. Weinstein and Anil V. Rao
% ADiGator may be obtained at https://sourceforge.net/projects/adigator/ 
% Contact: mweinstein@ufl.edu
% Bugs/suggestions may be reported to the sourceforge forums
%                    DISCLAIMER
% ADiGator is a general-purpose software distributed under the GNU General
% Public License version 3.0. While the software is distributed with the
% hope that it will be useful, both the software and generated code are
% provided 'AS IS' with NO WARRANTIES OF ANY KIND and no merchantability
% or fitness for any purpose or application.

function [ResNorm_intsum,Res_intsum] = minresCost_Y(X,U,p,T,data)
global ADiGator_minresCost_Y
if isempty(ADiGator_minresCost_Y); ADiGator_LoadData(); end
Gator1Data = ADiGator_minresCost_Y.minresCost_Y.Gator1Data;
% ADiGator Start Derivative Computations
%User Line: %costResidualMin_ModeMinRes_Adigator - cost computation for integrated residual minimization (alternating method: residual minimization) with Adigator
%User Line: %
%User Line: % Syntax:   [ ResNorm_intsum, Res_intsum ] = costResidualMin_ModeMinRes_Adigator( X,U,p,T,data)
%User Line: %
%User Line: % Copyright (C) 2019 Yuanbo Nie, Omar Faqir, and Eric Kerrigan. All Rights Reserved.
%User Line: % The contribution of Paola Falugi, Eric Kerrigan and Eugene van Wyk for the work on ICLOCS Version 1 (2010) is kindly acknowledged.
%User Line: % This code is published under the MIT License.
%User Line: % Department of Aeronautics and Department of Electrical and Electronic Engineering,
%User Line: % Imperial College London London  England, UK
%User Line: % ICLOCS (Imperial College London Optimal Control) Version 2.5
%User Line: % 1 Aug 2019
%User Line: % iclocs@imperial.ac.uk
dataNLP=data.dataNLP;
%User Line: dataNLP=data.dataNLP;
f=dataNLP.data.InternalDynamics;
%User Line: f=dataNLP.data.InternalDynamics;
dyn_data=data.dataNLP.data;
%User Line: dyn_data=data.dataNLP.data;
cadaconditional1 = strcmp(dataNLP.options.discretization,'globalLGR') | strcmp(dataNLP.options.discretization,'hpLGR');
%User Line: cadaconditional1 = strcmp(dataNLP.options.discretization,'globalLGR') | strcmp(dataNLP.options.discretization,'hpLGR');
    %User Line: % p/hp Transcription Method
    %User Line: n=dataNLP.sizes{3};
    %User Line: ng_eq=dataNLP.sizes{18};
    %User Line: t_0=T(1);
    %User Line: t_f=T(end);
    %User Line: delta_t=t_f-t_0;
    %User Line: U=[U;U(end,:)];
    %User Line: X_quad=data.sumInterpHMat*(data.InterpH*X);
    %User Line: U_quad=data.sumInterpHMat*(data.InterpH*U);
    %User Line: X_quad(data.interp_fixi,:)=X(data.interp_fixj,:);
    %User Line: U_quad(data.interp_fixi,:)=U(data.interp_fixj,:);
    %User Line: dX_quad=data.DT_seg_mat_d2*(data.D_mat*X_quad)/delta_t;
    %User Line: P_quad=repmat(p,data.M_quad,1);
    %User Line: T_quad=data.tau_quad*delta_t;
    %User Line: Fp=f(X_quad,U_quad,P_quad,T_quad,dyn_data);
    %User Line: Res=(dX_quad-Fp).^2;
    %User Line: Res_int=delta_t*data.DT_seg_node_mat./2*data.sum_nps_quad*Res;
    %User Line: % h Transcription Method
    n.f = dataNLP.sizes{3};
    %User Line: n=dataNLP.sizes{3};
    nt.f = dataNLP.sizes{1};
    %User Line: nt=dataNLP.sizes{1};
    M.f = dataNLP.sizes{7};
    %User Line: M=dataNLP.sizes{7};
    ng_eq.f = dataNLP.sizes{15};
    %User Line: ng_eq=dataNLP.sizes{15};
    cadaconditional1 = nt.f;
    %User Line: cadaconditional1 = nt;
        t_0.dY = T.dY(1);
        t_0.f = T.f(1);
        %User Line: t_0=T(1);
        cada1f1 = length(T.f);
        t_f.dY = T.dY(2);
        t_f.f = T.f(cada1f1);
        %User Line: t_f=T(end);
        cada1td1 = zeros(2,1);
        cada1td1(2) = t_f.dY;
        cada1td1(1) = cada1td1(1) + -t_0.dY;
        delta_t.dY = cada1td1;
        delta_t.f = t_f.f - t_0.f;
        %User Line: delta_t=t_f-t_0;
        P.f = repmat(p,15,1);
        %User Line: P=repmat(p,M,1);
        cada1f1 = size(X.f,1);
        cada1f2 = 1:2:cada1f1;
        X_col.dY = X.dY(Gator1Data.Index1);
        X_col.f = X.f(cada1f2,:);
        %User Line: X_col=X(1:2:end,:);
        cada1f1 = size(U.f,1);
        cada1f2 = 1:2:cada1f1;
        U_col.dY = U.dY(Gator1Data.Index2);
        U_col.f = U.f(cada1f2,:);
        %User Line: U_col=U(1:2:end,:);
        cada1f1 = length(data.tau);
        cada1f2 = 1:2:cada1f1;
        cada1f3 = data.tau(cada1f2);
        cada1tempdY = delta_t.dY(Gator1Data.Index3);
        cada1tf1 = cada1f3(Gator1Data.Index5);
        T_col.dY = cada1tf1(:).*cada1tempdY(Gator1Data.Index4);
        T_col.f = cada1f3*delta_t.f;
        %User Line: T_col=data.tau(1:2:end)*delta_t;
        cada1f1dY = X_col.dY(Gator1Data.Index6);
        cada1f1 = X_col.f(:,1);
        cada1f2dY = X_col.dY(Gator1Data.Index7);
        cada1f2 = X_col.f(:,2);
        cada1f3dY = X_col.dY(Gator1Data.Index8);
        cada1f3 = X_col.f(:,3);
        cada1f4dY = X_col.dY(Gator1Data.Index9);
        cada1f4 = X_col.f(:,4);
        cada1f5dY = U_col.dY(Gator1Data.Index10);
        cada1f5 = U_col.f(:,1);
        cada1f6 = dyn_data.L*dyn_data.m2;
        cada1f7dY = cos(cada1f4(:)).*cada1f4dY;
        cada1f7 = sin(cada1f4);
        cada1f8dY = cada1f6.*cada1f7dY;
        cada1f8 = cada1f6*cada1f7;
        cada1f9dY = 2.*cada1f2(:).^(2-1).*cada1f2dY;
        cada1f9 = cada1f2.^2;
        cada1td1 = zeros(16,1);
        cada1td1(Gator1Data.Index11) = cada1f9(:).*cada1f8dY;
        cada1td1(Gator1Data.Index12) = cada1td1(Gator1Data.Index12) + cada1f8(:).*cada1f9dY;
        cada1f10dY = cada1td1;
        cada1f10 = cada1f8.*cada1f9;
        cada1td1 = zeros(24,1);
        cada1td1(Gator1Data.Index13) = cada1f10dY;
        cada1td1(Gator1Data.Index14) = cada1td1(Gator1Data.Index14) + cada1f5dY;
        cada1f11dY = cada1td1;
        cada1f11 = cada1f10 + cada1f5;
        cada1f12 = dyn_data.m2*dyn_data.g;
        cada1f13dY = -sin(cada1f4(:)).*cada1f4dY;
        cada1f13 = cos(cada1f4);
        cada1f14dY = cada1f12.*cada1f13dY;
        cada1f14 = cada1f12*cada1f13;
        cada1f15dY = cos(cada1f4(:)).*cada1f4dY;
        cada1f15 = sin(cada1f4);
        cada1td1 = cada1f15(:).*cada1f14dY;
        cada1td1 = cada1td1 + cada1f14(:).*cada1f15dY;
        cada1f16dY = cada1td1;
        cada1f16 = cada1f14.*cada1f15;
        cada1td1 = cada1f11dY;
        cada1td1(Gator1Data.Index15) = cada1td1(Gator1Data.Index15) + cada1f16dY;
        cada1f17dY = cada1td1;
        cada1f17 = cada1f11 + cada1f16;
        cada1f18dY = -sin(cada1f4(:)).*cada1f4dY;
        cada1f18 = cos(cada1f4);
        cada1f19dY = 2.*cada1f18(:).^(2-1).*cada1f18dY;
        cada1f19 = cada1f18.^2;
        cada1f20dY = -cada1f19dY;
        cada1f20 = 1 - cada1f19;
        cada1f21dY = dyn_data.m2.*cada1f20dY;
        cada1f21 = dyn_data.m2*cada1f20;
        cada1f22dY = cada1f21dY;
        cada1f22 = dyn_data.m1 + cada1f21;
        cada1tf1 = cada1f22(Gator1Data.Index16);
        cada1td1 = cada1f17dY./cada1tf1(:);
        cada1td1(Gator1Data.Index17) = cada1td1(Gator1Data.Index17) + -cada1f17(:)./cada1f22(:).^2.*cada1f22dY;
        cada1f23dY = cada1td1;
        cada1f23 = cada1f17./cada1f22;
        cada1temp1 = Gator1Data.Data1;
        cada1f24dY = cada1f23dY;
        cada1f24 = cada1temp1;
        cada1f24(:,1) = cada1f23;
        cada1f25 = dyn_data.L*dyn_data.m2;
        cada1f26dY = -sin(cada1f4(:)).*cada1f4dY;
        cada1f26 = cos(cada1f4);
        cada1f27dY = cada1f25.*cada1f26dY;
        cada1f27 = cada1f25*cada1f26;
        cada1f28dY = cos(cada1f4(:)).*cada1f4dY;
        cada1f28 = sin(cada1f4);
        cada1td1 = cada1f28(:).*cada1f27dY;
        cada1td1 = cada1td1 + cada1f27(:).*cada1f28dY;
        cada1f29dY = cada1td1;
        cada1f29 = cada1f27.*cada1f28;
        cada1f30dY = 2.*cada1f2(:).^(2-1).*cada1f2dY;
        cada1f30 = cada1f2.^2;
        cada1td1 = zeros(16,1);
        cada1td1(Gator1Data.Index18) = cada1f30(:).*cada1f29dY;
        cada1td1(Gator1Data.Index19) = cada1td1(Gator1Data.Index19) + cada1f29(:).*cada1f30dY;
        cada1f31dY = cada1td1;
        cada1f31 = cada1f29.*cada1f30;
        cada1f32dY = -sin(cada1f4(:)).*cada1f4dY;
        cada1f32 = cos(cada1f4);
        cada1td1 = zeros(16,1);
        cada1td1(Gator1Data.Index20) = cada1f32(:).*cada1f5dY;
        cada1td1(Gator1Data.Index21) = cada1td1(Gator1Data.Index21) + cada1f5(:).*cada1f32dY;
        cada1f33dY = cada1td1;
        cada1f33 = cada1f5.*cada1f32;
        cada1td1 = zeros(24,1);
        cada1td1(Gator1Data.Index22) = cada1f31dY;
        cada1td1(Gator1Data.Index23) = cada1td1(Gator1Data.Index23) + cada1f33dY;
        cada1f34dY = cada1td1;
        cada1f34 = cada1f31 + cada1f33;
        cada1f35 = dyn_data.m1 + dyn_data.m2;
        cada1f36 = cada1f35*dyn_data.g;
        cada1f37dY = cos(cada1f4(:)).*cada1f4dY;
        cada1f37 = sin(cada1f4);
        cada1f38dY = cada1f36.*cada1f37dY;
        cada1f38 = cada1f36*cada1f37;
        cada1td1 = cada1f34dY;
        cada1td1(Gator1Data.Index24) = cada1td1(Gator1Data.Index24) + cada1f38dY;
        cada1f39dY = cada1td1;
        cada1f39 = cada1f34 + cada1f38;
        cada1f40dY = -cada1f39dY;
        cada1f40 = uminus(cada1f39);
        cada1f41 = dyn_data.L*dyn_data.m1;
        cada1f42 = dyn_data.L*dyn_data.m2;
        cada1f43dY = -sin(cada1f4(:)).*cada1f4dY;
        cada1f43 = cos(cada1f4);
        cada1f44dY = 2.*cada1f43(:).^(2-1).*cada1f43dY;
        cada1f44 = cada1f43.^2;
        cada1f45dY = -cada1f44dY;
        cada1f45 = 1 - cada1f44;
        cada1f46dY = cada1f42.*cada1f45dY;
        cada1f46 = cada1f42*cada1f45;
        cada1f47dY = cada1f46dY;
        cada1f47 = cada1f41 + cada1f46;
        cada1tf1 = cada1f47(Gator1Data.Index25);
        cada1td1 = cada1f40dY./cada1tf1(:);
        cada1td1(Gator1Data.Index26) = cada1td1(Gator1Data.Index26) + -cada1f40(:)./cada1f47(:).^2.*cada1f47dY;
        cada1f48dY = cada1td1;
        cada1f48 = cada1f40./cada1f47;
        cada1td1 = zeros(48,1);
        cada1td1(Gator1Data.Index27) = cada1f48dY;
        cada1td1(Gator1Data.Index28) = cada1f24dY(Gator1Data.Index29);
        cada1f49dY = cada1td1;
        cada1f49 = cada1f24;
        cada1f49(:,2) = cada1f48;
        cada1td1 = zeros(56,1);
        cada1td1(Gator1Data.Index30) = cada1f1dY;
        cada1td1(Gator1Data.Index31) = cada1f49dY(Gator1Data.Index32);
        cada1f50dY = cada1td1;
        cada1f50 = cada1f49;
        cada1f50(:,3) = cada1f1;
        cada1td1 = zeros(64,1);
        cada1td1(Gator1Data.Index33) = cada1f2dY;
        cada1td1(Gator1Data.Index34) = cada1f50dY(Gator1Data.Index35);
        F_k.dY = cada1td1;
        F_k.f = cada1f50;
        F_k.f(:,4) = cada1f2;
        %User Line: F_k=f(X_col,U_col,P,T_col,dyn_data);
        cada1td1 = sparse(Gator1Data.Index36,Gator1Data.Index37,X.dY,15,60);
        cada1td1 = data.DxHS_hf*cada1td1;
        cada1td1 = cada1td1(:);
        cada1f1dY = full(cada1td1(Gator1Data.Index38));
        cada1f1 = data.DxHS_hf*X.f;
        cada1tempdY = delta_t.dY(Gator1Data.Index39);
        cada1td1 = zeros(140,1);
        cada1td1(Gator1Data.Index40) = cada1f1dY./delta_t.f;
        cada1tf1 = cada1f1(Gator1Data.Index41);
        cada1td1(Gator1Data.Index42) = cada1td1(Gator1Data.Index42) + -cada1tf1(:)./delta_t.f.^2.*cada1tempdY;
        cada1f2dY = cada1td1;
        cada1f2 = cada1f1/delta_t.f;
        cada1f3 = size(F_k.f,1);
        cada1f4 = cada1f3 - 1;
        cada1f5 = 1:cada1f4;
        cada1f6dY = F_k.dY(Gator1Data.Index43);
        cada1f6 = F_k.f(cada1f5,:);
        cada1f7dY = cada1f6dY./2;
        cada1f7 = cada1f6/2;
        cada1td1 = zeros(189,1);
        cada1td1(Gator1Data.Index44) = cada1f2dY;
        cada1td1(Gator1Data.Index45) = cada1td1(Gator1Data.Index45) + -cada1f7dY;
        F_kph.dY = cada1td1;
        F_kph.f = cada1f2 - cada1f7;
        %User Line: F_kph=data.DxHS_hf*X/delta_t-F_k(1:end-1,:)/2;
        cada1td1 = sparse(Gator1Data.Index46,Gator1Data.Index47,X.dY,15,60);
        cada1td1 = data.DxHS_p1*cada1td1;
        cada1td1 = cada1td1(:);
        cada1f1dY = full(cada1td1(Gator1Data.Index48));
        cada1f1 = data.DxHS_p1*X.f;
        cada1tempdY = delta_t.dY(Gator1Data.Index49);
        cada1td1 = zeros(140,1);
        cada1td1(Gator1Data.Index50) = cada1f1dY./delta_t.f;
        cada1tf1 = cada1f1(Gator1Data.Index51);
        cada1td1(Gator1Data.Index52) = cada1td1(Gator1Data.Index52) + -cada1tf1(:)./delta_t.f.^2.*cada1tempdY;
        cada1f2dY = cada1td1;
        cada1f2 = cada1f1/delta_t.f;
        cada1f3 = size(F_k.f,1);
        cada1f4 = cada1f3 - 1;
        cada1f5 = 1:cada1f4;
        cada1f6dY = F_k.dY(Gator1Data.Index53);
        cada1f6 = F_k.f(cada1f5,:);
        cada1td1 = zeros(189,1);
        cada1td1(Gator1Data.Index54) = cada1f2dY;
        cada1td1(Gator1Data.Index55) = cada1td1(Gator1Data.Index55) + cada1f6dY;
        F_kp1.dY = cada1td1;
        F_kp1.f = cada1f2 + cada1f6;
        %User Line: F_kp1=data.DxHS_p1*X/delta_t+F_k(1:end-1,:);
        cada1f1 = size(F_k.f,1);
        cada1f2 = cada1f1 - 1;
        cada1f3 = 1:cada1f2;
        cada1f4dY = F_k.dY(Gator1Data.Index56);
        cada1f4 = F_k.f(cada1f3,:);
        cada1td1 = zeros(434,1);
        cada1td1(Gator1Data.Index57) = cada1f4dY;
        cada1td1(Gator1Data.Index58) = F_kph.dY;
        cada1td1(Gator1Data.Index59) = F_kp1.dY;
        cada1f5dY = cada1td1;
        cada1f5 = [cada1f4 F_kph.f F_kp1.f];
        F.dY = cada1f5dY(Gator1Data.Index60);
        F.f = cada1f5.';
        %User Line: F=[F_k(1:end-1,:) F_kph F_kp1]';
        cada1f1dY = F.dY;
        cada1f1 = F.f(:);
        cada1f2 = 3*data.nps;
        cada1f3dY = cada1f1dY;
        cada1f3 = reshape(cada1f1,n.f,cada1f2);
        F.dY = cada1f3dY(Gator1Data.Index61);
        F.f = cada1f3.';
        %User Line: F=reshape(F(:),n,3*data.nps)';
        cada1f1 = size(X.f,1);
        cada1f2 = cada1f1 - 1;
        cada1f3 = 1:2:cada1f2;
        cada1f4dY = X.dY(Gator1Data.Index62);
        cada1f4 = X.f(cada1f3,:);
        cada1td1 = zeros(7,28);
        cada1td1(Gator1Data.Index63) = cada1f4dY;
        cada1td1 = data.repXend_mat*cada1td1;
        cada1td1 = cada1td1(:);
        cada1f5dY = cada1td1(Gator1Data.Index64);
        cada1f5 = data.repXend_mat*cada1f4;
        cada1tempdY = delta_t.dY(Gator1Data.Index65);
        cada1tf1 = data.AxHS(Gator1Data.Index67);
        cada1f6dY = cada1tf1(:).*cada1tempdY(Gator1Data.Index66);
        cada1f6 = delta_t.f*data.AxHS;
        cada1td2 = sparse(Gator1Data.Index68,Gator1Data.Index69,cada1f6dY,21,186);
        cada1td2 = F.f.'*cada1td2;
        cada1td1 = zeros(2511,1);
        cada1td1(Gator1Data.Index71) = cada1td2(Gator1Data.Index70);
        cada1td2 = sparse(Gator1Data.Index72,Gator1Data.Index73,F.dY,21,117);
        cada1td2 = cada1f6*cada1td2;
        cada1td2 = cada1td2(:);
        cada1td1 = cada1td1 + full(cada1td2(Gator1Data.Index74));
        cada1f7dY = cada1td1;
        cada1f7 = cada1f6*F.f;
        cada1td1 = zeros(2531,1);
        cada1td1(Gator1Data.Index75) = cada1f5dY;
        cada1td1(Gator1Data.Index76) = cada1td1(Gator1Data.Index76) + cada1f7dY;
        X_quad.dY = cada1td1;
        X_quad.f = cada1f5 + cada1f7;
        %User Line: X_quad=data.repXend_mat*X(1:2:end-1,:)+delta_t*data.AxHS*F;
        cada1td1 = zeros(15,15);
        cada1td1(Gator1Data.Index77) = U.dY;
        cada1td1 = data.AuHS*cada1td1;
        cada1td1 = cada1td1(:);
        U_quad.dY = cada1td1(Gator1Data.Index78);
        U_quad.f = data.AuHS*U.f;
        %User Line: U_quad=data.AuHS*U;
        cada1td1 = sparse(Gator1Data.Index79,Gator1Data.Index80,F.dY,21,117);
        cada1td1 = data.AfHS*cada1td1;
        cada1td1 = cada1td1(:);
        dX_quad.dY = full(cada1td1(Gator1Data.Index81));
        dX_quad.f = data.AfHS*F.f;
        %User Line: dX_quad=data.AfHS*F;
        P_quad.f = repmat(p,98,1);
        %User Line: P_quad=repmat(p,data.M_quad,1);
        cada1tempdY = delta_t.dY(Gator1Data.Index82);
        cada1tf1 = data.tau_quad(Gator1Data.Index84);
        T_quad.dY = cada1tf1(:).*cada1tempdY(Gator1Data.Index83);
        T_quad.f = data.tau_quad*delta_t.f;
        %User Line: T_quad=data.tau_quad*delta_t;
        cada1f1dY = X_quad.dY(Gator1Data.Index85);
        cada1f1 = X_quad.f(:,1);
        cada1f2dY = X_quad.dY(Gator1Data.Index86);
        cada1f2 = X_quad.f(:,2);
        cada1f3dY = X_quad.dY(Gator1Data.Index87);
        cada1f3 = X_quad.f(:,3);
        cada1f4dY = X_quad.dY(Gator1Data.Index88);
        cada1f4 = X_quad.f(:,4);
        cada1f5dY = U_quad.dY(Gator1Data.Index89);
        cada1f5 = U_quad.f(:,1);
        cada1f6 = dyn_data.L*dyn_data.m2;
        cada1tf1 = cada1f4(Gator1Data.Index90);
        cada1f7dY = cos(cada1tf1(:)).*cada1f4dY;
        cada1f7 = sin(cada1f4);
        cada1f8dY = cada1f6.*cada1f7dY;
        cada1f8 = cada1f6*cada1f7;
        cada1tf2 = cada1f2(Gator1Data.Index91);
        cada1f9dY = 2.*cada1tf2(:).^(2-1).*cada1f2dY;
        cada1f9 = cada1f2.^2;
        cada1tf1 = cada1f9(Gator1Data.Index92);
        cada1td1 = zeros(847,1);
        cada1td1(Gator1Data.Index93) = cada1tf1(:).*cada1f8dY;
        cada1tf1 = cada1f8(Gator1Data.Index94);
        cada1td1(Gator1Data.Index95) = cada1td1(Gator1Data.Index95) + cada1tf1(:).*cada1f9dY;
        cada1f10dY = cada1td1;
        cada1f10 = cada1f8.*cada1f9;
        cada1td1 = zeros(1033,1);
        cada1td1(Gator1Data.Index96) = cada1f10dY;
        cada1td1(Gator1Data.Index97) = cada1td1(Gator1Data.Index97) + cada1f5dY;
        cada1f11dY = cada1td1;
        cada1f11 = cada1f10 + cada1f5;
        cada1f12 = dyn_data.m2*dyn_data.g;
        cada1tf1 = cada1f4(Gator1Data.Index98);
        cada1f13dY = -sin(cada1tf1(:)).*cada1f4dY;
        cada1f13 = cos(cada1f4);
        cada1f14dY = cada1f12.*cada1f13dY;
        cada1f14 = cada1f12*cada1f13;
        cada1tf1 = cada1f4(Gator1Data.Index99);
        cada1f15dY = cos(cada1tf1(:)).*cada1f4dY;
        cada1f15 = sin(cada1f4);
        cada1tf1 = cada1f15(Gator1Data.Index100);
        cada1td1 = cada1tf1(:).*cada1f14dY;
        cada1tf1 = cada1f14(Gator1Data.Index101);
        cada1td1 = cada1td1 + cada1tf1(:).*cada1f15dY;
        cada1f16dY = cada1td1;
        cada1f16 = cada1f14.*cada1f15;
        cada1td1 = cada1f11dY;
        cada1td1(Gator1Data.Index102) = cada1td1(Gator1Data.Index102) + cada1f16dY;
        cada1f17dY = cada1td1;
        cada1f17 = cada1f11 + cada1f16;
        cada1tf1 = cada1f4(Gator1Data.Index103);
        cada1f18dY = -sin(cada1tf1(:)).*cada1f4dY;
        cada1f18 = cos(cada1f4);
        cada1tf2 = cada1f18(Gator1Data.Index104);
        cada1f19dY = 2.*cada1tf2(:).^(2-1).*cada1f18dY;
        cada1f19 = cada1f18.^2;
        cada1f20dY = -cada1f19dY;
        cada1f20 = 1 - cada1f19;
        cada1f21dY = dyn_data.m2.*cada1f20dY;
        cada1f21 = dyn_data.m2*cada1f20;
        cada1f22dY = cada1f21dY;
        cada1f22 = dyn_data.m1 + cada1f21;
        cada1tf1 = cada1f22(Gator1Data.Index105);
        cada1td1 = cada1f17dY./cada1tf1(:);
        cada1tf1 = cada1f17(Gator1Data.Index106);
        cada1tf2 = cada1f22(Gator1Data.Index107);
        cada1td1(Gator1Data.Index108) = cada1td1(Gator1Data.Index108) + -cada1tf1(:)./cada1tf2(:).^2.*cada1f22dY;
        cada1f23dY = cada1td1;
        cada1f23 = cada1f17./cada1f22;
        cada1temp1 = Gator1Data.Data2;
        cada1f24dY = cada1f23dY;
        cada1f24 = cada1temp1;
        cada1f24(:,1) = cada1f23;
        cada1f25 = dyn_data.L*dyn_data.m2;
        cada1tf1 = cada1f4(Gator1Data.Index109);
        cada1f26dY = -sin(cada1tf1(:)).*cada1f4dY;
        cada1f26 = cos(cada1f4);
        cada1f27dY = cada1f25.*cada1f26dY;
        cada1f27 = cada1f25*cada1f26;
        cada1tf1 = cada1f4(Gator1Data.Index110);
        cada1f28dY = cos(cada1tf1(:)).*cada1f4dY;
        cada1f28 = sin(cada1f4);
        cada1tf1 = cada1f28(Gator1Data.Index111);
        cada1td1 = cada1tf1(:).*cada1f27dY;
        cada1tf1 = cada1f27(Gator1Data.Index112);
        cada1td1 = cada1td1 + cada1tf1(:).*cada1f28dY;
        cada1f29dY = cada1td1;
        cada1f29 = cada1f27.*cada1f28;
        cada1tf2 = cada1f2(Gator1Data.Index113);
        cada1f30dY = 2.*cada1tf2(:).^(2-1).*cada1f2dY;
        cada1f30 = cada1f2.^2;
        cada1tf1 = cada1f30(Gator1Data.Index114);
        cada1td1 = zeros(847,1);
        cada1td1(Gator1Data.Index115) = cada1tf1(:).*cada1f29dY;
        cada1tf1 = cada1f29(Gator1Data.Index116);
        cada1td1(Gator1Data.Index117) = cada1td1(Gator1Data.Index117) + cada1tf1(:).*cada1f30dY;
        cada1f31dY = cada1td1;
        cada1f31 = cada1f29.*cada1f30;
        cada1tf1 = cada1f4(Gator1Data.Index118);
        cada1f32dY = -sin(cada1tf1(:)).*cada1f4dY;
        cada1f32 = cos(cada1f4);
        cada1tf1 = cada1f32(Gator1Data.Index119);
        cada1td1 = zeros(837,1);
        cada1td1(Gator1Data.Index120) = cada1tf1(:).*cada1f5dY;
        cada1tf1 = cada1f5(Gator1Data.Index121);
        cada1td1(Gator1Data.Index122) = cada1td1(Gator1Data.Index122) + cada1tf1(:).*cada1f32dY;
        cada1f33dY = cada1td1;
        cada1f33 = cada1f5.*cada1f32;
        cada1td1 = zeros(1033,1);
        cada1td1(Gator1Data.Index123) = cada1f31dY;
        cada1td1(Gator1Data.Index124) = cada1td1(Gator1Data.Index124) + cada1f33dY;
        cada1f34dY = cada1td1;
        cada1f34 = cada1f31 + cada1f33;
        cada1f35 = dyn_data.m1 + dyn_data.m2;
        cada1f36 = cada1f35*dyn_data.g;
        cada1tf1 = cada1f4(Gator1Data.Index125);
        cada1f37dY = cos(cada1tf1(:)).*cada1f4dY;
        cada1f37 = sin(cada1f4);
        cada1f38dY = cada1f36.*cada1f37dY;
        cada1f38 = cada1f36*cada1f37;
        cada1td1 = cada1f34dY;
        cada1td1(Gator1Data.Index126) = cada1td1(Gator1Data.Index126) + cada1f38dY;
        cada1f39dY = cada1td1;
        cada1f39 = cada1f34 + cada1f38;
        cada1f40dY = -cada1f39dY;
        cada1f40 = uminus(cada1f39);
        cada1f41 = dyn_data.L*dyn_data.m1;
        cada1f42 = dyn_data.L*dyn_data.m2;
        cada1tf1 = cada1f4(Gator1Data.Index127);
        cada1f43dY = -sin(cada1tf1(:)).*cada1f4dY;
        cada1f43 = cos(cada1f4);
        cada1tf2 = cada1f43(Gator1Data.Index128);
        cada1f44dY = 2.*cada1tf2(:).^(2-1).*cada1f43dY;
        cada1f44 = cada1f43.^2;
        cada1f45dY = -cada1f44dY;
        cada1f45 = 1 - cada1f44;
        cada1f46dY = cada1f42.*cada1f45dY;
        cada1f46 = cada1f42*cada1f45;
        cada1f47dY = cada1f46dY;
        cada1f47 = cada1f41 + cada1f46;
        cada1tf1 = cada1f47(Gator1Data.Index129);
        cada1td1 = cada1f40dY./cada1tf1(:);
        cada1tf1 = cada1f40(Gator1Data.Index130);
        cada1tf2 = cada1f47(Gator1Data.Index131);
        cada1td1(Gator1Data.Index132) = cada1td1(Gator1Data.Index132) + -cada1tf1(:)./cada1tf2(:).^2.*cada1f47dY;
        cada1f48dY = cada1td1;
        cada1f48 = cada1f40./cada1f47;
        cada1td1 = zeros(2066,1);
        cada1td1(Gator1Data.Index133) = cada1f48dY;
        cada1td1(Gator1Data.Index134) = cada1f24dY(Gator1Data.Index135);
        cada1f49dY = cada1td1;
        cada1f49 = cada1f24;
        cada1f49(:,2) = cada1f48;
        cada1td1 = zeros(2815,1);
        cada1td1(Gator1Data.Index136) = cada1f1dY;
        cada1td1(Gator1Data.Index137) = cada1f49dY(Gator1Data.Index138);
        cada1f50dY = cada1td1;
        cada1f50 = cada1f49;
        cada1f50(:,3) = cada1f1;
        cada1td1 = zeros(3471,1);
        cada1td1(Gator1Data.Index139) = cada1f2dY;
        cada1td1(Gator1Data.Index140) = cada1f50dY(Gator1Data.Index141);
        Fp.dY = cada1td1;
        Fp.f = cada1f50;
        Fp.f(:,4) = cada1f2;
        %User Line: Fp=f(X_quad,U_quad,P_quad,T_quad,dyn_data);
        cada1td1 = zeros(4215,1);
        cada1td1(Gator1Data.Index142) = dX_quad.dY;
        cada1td1(Gator1Data.Index143) = cada1td1(Gator1Data.Index143) + -Fp.dY;
        cada1f1dY = cada1td1;
        cada1f1 = dX_quad.f - Fp.f;
        cada1tf2 = cada1f1(Gator1Data.Index144);
        Res.dY = 2.*cada1tf2(:).^(2-1).*cada1f1dY;
        Res.f = cada1f1.^2;
        %User Line: Res=(dX_quad-Fp).^2;
        cada1tempdY = delta_t.dY(Gator1Data.Index145);
        cada1tf1 = data.DT_seg_node_mat(Gator1Data.Index147);
        cada1f1dY = cada1tf1(:).*cada1tempdY(Gator1Data.Index146);
        cada1f1 = delta_t.f*data.DT_seg_node_mat;
        cada1f2dY = cada1f1dY./2;
        cada1f2 = cada1f1/2;
        cada1td1 = zeros(7,14);
        cada1td1(Gator1Data.Index148) = cada1f2dY;
        cada1td1 = data.sum_nps_quad.'*cada1td1;
        cada1td1 = cada1td1(:);
        cada1f3dY = cada1td1(Gator1Data.Index149);
        cada1f3 = cada1f2*data.sum_nps_quad;
        cada1td2 = sparse(Gator1Data.Index150,Gator1Data.Index151,cada1f3dY,98,14);
        cada1td2 = Res.f.'*cada1td2;
        cada1td1 = zeros(315,1);
        cada1td1(Gator1Data.Index153) = cada1td2(Gator1Data.Index152);
        cada1td2 = sparse(Gator1Data.Index154,Gator1Data.Index155,Res.dY,98,201);
        cada1td2 = cada1f3*cada1td2;
        cada1td2 = cada1td2(:);
        cada1td1 = cada1td1 + full(cada1td2(Gator1Data.Index156));
        Res_int.dY = cada1td1;
        Res_int.f = cada1f3*Res.f;
        %User Line: Res_int=delta_t*data.DT_seg_node_mat./2*data.sum_nps_quad*Res;
        %User Line: t0=dataNLP.t0;
        %User Line: tf=dataNLP.tf;
        %User Line: deltat=tf-t0;
        %User Line: P=repmat(p,M,1);
        %User Line: X_col=X(1:2:end,:);
        %User Line: U_col=U(1:2:end,:);
        %User Line: T_col=data.tau(1:2:end)*deltat;
        %User Line: F_k=f(X_col,U_col,P,T_col,dyn_data);
        %User Line: F_kph=data.DxHS_hf*X/deltat-F_k(1:end-1,:)/2;
        %User Line: F_kp1=data.DxHS_p1*X/deltat+F_k(1:end-1,:);
        %User Line: F=[F_k(1:end-1,:) F_kph F_kp1]';
        %User Line: F=reshape(F(:),n,3*data.nps)';
        %User Line: X_quad=data.repXend_mat*X(1:2:end-1,:)+deltat*data.AxHS*F;
        %User Line: U_quad=data.AuHS*U;
        %User Line: dX_quad=data.AfHS*F;
        %User Line: P_quad=repmat(p,data.M_quad,1);
        %User Line: T_quad=data.tau_quad*deltat;
        %User Line: Fp=f(X_quad,U_quad,P_quad,T_quad,dyn_data);
        %User Line: Res=(dX_quad-Fp).^2;
        %User Line: Res_int=deltat*data.DT_seg_node_mat./2*data.sum_nps_quad*Res;
%User Line: % Compuation of integrated residual for each dynamics equation
cada1f1dY = Res_int.dY;
cada1f1 = Res_int.f(:);
cada1td1 = sparse(Gator1Data.Index157,Gator1Data.Index158,cada1f1dY,28,77);
cada1td1 = data.ResConstScaleMat*cada1td1;
cada1td1 = cada1td1(:);
Res_int_Const.dY = full(cada1td1(Gator1Data.Index159));
Res_int_Const.f = data.ResConstScaleMat*cada1f1;
%User Line: Res_int_Const=data.ResConstScaleMat*Res_int(:);
cada1f1 = n.f + ng_eq.f;
Res_int_Const.dY = Res_int_Const.dY;
Res_int_Const.f = reshape(Res_int_Const.f,data.nps,cada1f1);
%User Line: Res_int_Const=reshape(Res_int_Const,data.nps,n+ng_eq);
cada1td1 = sum(sparse(Gator1Data.Index160,Gator1Data.Index161,Res_int_Const.dY,7,201),1);
cada1f1dY = full(cada1td1(:));
cada1f1 = sum(Res_int_Const.f);
Res_intsum.dY = cada1f1dY;
Res_intsum.f = cada1f1.';
%User Line: Res_intsum=sum(Res_int_Const)';
%User Line: % Compuation of integrated residual norm
cada1f1dY = Res_int.dY;
cada1f1 = Res_int.f(:);
cada1td1 = sparse(Gator1Data.Index162,Gator1Data.Index163,cada1f1dY,28,77);
cada1td1 = data.ResNormScaleMat*cada1td1;
cada1td1 = cada1td1(:);
Res_int_Norm.dY = full(cada1td1(Gator1Data.Index164));
Res_int_Norm.f = data.ResNormScaleMat*cada1f1;
%User Line: Res_int_Norm=data.ResNormScaleMat*Res_int(:);
cada1f1 = n.f + ng_eq.f;
Res_int_Norm.dY = Res_int_Norm.dY;
Res_int_Norm.f = reshape(Res_int_Norm.f,data.nps,cada1f1);
%User Line: Res_int_Norm=reshape(Res_int_Norm,data.nps,n+ng_eq);
cada1td1 = sum(sparse(Gator1Data.Index165,Gator1Data.Index166,Res_int_Norm.dY,7,201),1);
cada1f1dY = full(cada1td1(:));
cada1f1 = sum(Res_int_Norm.f);
cada1td1 = sum(sparse(Gator1Data.Index167,Gator1Data.Index168,cada1f1dY,4,77),1);
ResNorm_intsum.dY = full(cada1td1(:));
ResNorm_intsum.f = sum(cada1f1);
%User Line: ResNorm_intsum=sum(sum(Res_int_Norm));
ResNorm_intsum.dY_size = 77;
ResNorm_intsum.dY_location = Gator1Data.Index169;
Res_intsum.dY_size = [4,77];
Res_intsum.dY_location = Gator1Data.Index170;
end


function ADiGator_LoadData()
global ADiGator_minresCost_Y
ADiGator_minresCost_Y = load('minresCost_Y.mat');
return
end