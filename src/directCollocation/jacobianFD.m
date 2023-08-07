% -------------------------------------------------------------------------
%  2. Evaluate the Jacobian of the constraints
% -------------------------------------------------------------------------

function varargout=jacobianFD(f,g,avrc,X,U,P,T,b,x0,xf,u0,uf,p,t0,tf,data)
% jacobianFD - It evaluates numerically the Jacobian of the constraints
%
% Copyright (C) 2019 Yuanbo Nie, Omar Faqir, and Eric Kerrigan. All Rights Reserved.
% The contribution of Paola Falugi, Eric Kerrigan and Eugene van Wyk for the work on ICLOCS Version 1 (2010) is kindly acknowledged.
% This code is published under the MIT License.
% Department of Aeronautics and Department of Electrical and Electronic Engineering,
% Imperial College London London  England, UK 
% ICLOCS (Imperial College London Optimal Control) Version 2.5 
% 1 Aug 2019
% iclocs@imperial.ac.uk



e=data.options.perturbation.J;                                 % pertubation size
[nt,np,n,m,ng,nb,M,N,ns,nrcl,nrcu,nrce,~]=deal(data.sizes{1:13});
[ng_eq,ng_neq]=deal(data.sizes{15:16});
nrc=nrcl+nrcu+nrce;
nz=nt+np+M*n+N*m;
vdat=data.data;
fg=vdat.functionfg;

% Compute fz and gz
%------------

fz=spalloc(n*M,nz,data.map.spmatsize.jSf);
gz=spalloc(ng*M,nz,data.map.spmatsize.jSg);

if ng && size(data.FD.index.f,2)==size(data.FD.index.g,2)
    [ fz,gz,~ ] = jacConst_FD_FG( fz, gz, M, n, ng, nz, fg, X, U, P, t0, tf, T, e, vdat, data );
else

    [ fz,~ ] = jacConst_FD_F( fz, M, n, nz, f, X, U, P, t0, tf, T, e, vdat, data );
    
    if ng

        [ gz ] = jacConst_FD_G( gz, M, ng, nz, g, X, U, P, t0, tf, T, e, vdat, data );
    
    end
end

% Compute rcz
%------------

rcz=spalloc(nrc,nz,data.map.spmatsize.jSrc);
if nrc
    [ rcz ] = jacConst_RC( rcz, nrc, nz, avrc, X, U, P, t0, tf, T, e, data );
end

% Compute bz
%------------
bz=spalloc(nb,nz,data.map.spmatsize.jSb);
if nb
    [ bz ] = jacConst_FD_B( bz, nb, nz, b, x0, xf, u0, uf, p, t0, tf, e, vdat, data );
end



% Map derivatives to the jacobian
%---------------------------------
fzd=[[sparse(n,nt) sparse(n,np) speye(n), sparse(n,(M-1)*n+N*m)]*data.cx0;data.map.A*data.map.Vx+data.map.B*fz];
gzd=gz(data.gAllidx,:);

jac=[fzd;gzd;rcz;bz];

if nargout==1
    varargout{1}=jac;
elseif nargout==4
    varargout{1}=fzd;
    varargout{2}=gzd;
    varargout{3}=rcz;
    varargout{4}=bz;
end



