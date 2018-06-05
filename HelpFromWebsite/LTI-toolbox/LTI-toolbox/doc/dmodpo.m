
%% DMODPO
% Estimates the _A_ and _C_ matrices and the Kalman gain in a discrete-time
% state-space model from time-domain data that was preprocessed by
% <dordpo.html |dordpo|>.

%% Syntax
% |[A,C] = dmodpo(R,n)|
%%
% |[A,C,K] = dmodpo(R,n)|
%%
% |[A,C,K] = dmodpo(R,n,'stable')|

%% Description
% This function estimates the _A_ and _C_ matrices corresponding to an _n_
% th order discrete-time LTI state-space model. A Kalman gain can be
% estimated as well. The compressed data matrix _R_ from the preprocessor
% function <dordpo.html |dordpo|> is used to this end.
  
%% Inputs
% |R| is a compressed data matrix containing information about the measured
% data, as well as information regarding the system dimensions.
%%
% |n| is the desired model order _n_..
%%
% |stable| estimates a stable A matrix, see [2].

%% Outputs
% |A| is the state-space model's _A_ matrix.
%%
% |C| is the state-space model's _C_ matrix.
%%
% |K| is the Kalman gain matrix.

%% Remarks
% The data matrix |R| generated by the M-file implementation of
% <dordpo.html |dordpo|> is _incompatible_ with the |R| matrix generated by
% the MEX-implementation of <dordpo.html |dordpo|>. Therefore, either the
% M-files should be used for both <dordpo.html |dordpo|> and <dmodpo.html
% |dmodpo|>, or the MEX-files should be used for both functions. The stable
% option only works in the M-file implementation/
% 
% The MEX-implementation of <dmodpo.html |dmodpo|> uses the |IB01BD|
% function from the SLICOT library.
% 
% The MEX-implementation may generate the following warning:
%
% |Warning: Covariance matrices are too small: returning K=0|
%
% This implies that there is not enough information available to reliably
% estimate a Kalman gain. _K_ = _0_ is returned for stability reasons in
% this case.

%% Algorithm
% The data matrix obtained with <dordpi.html |dordpi|> contains the
% weighted left singular vectors of the _R32_ matrix. The first _n_ of
% these vectors form an estimate _Os_ of the system's extended
% observability matrix:
%%
% <<extobs.jpg>>
%%
% The estimates |Ahat| and |Chat| are obtained by linear regression:
%
% $$ \hat{C} = \hat{\mathcal{O}}_s(1:\ell,:) $$
%
% $$ \hat{A} = \hat{\mathcal{O}}_s(1:(s-1)\ell,:)^\dagger
% \hat{\mathcal{O}}_s(\ell+1:s\ell,:) $$
%
% The optional Kalman gain is aclculated based on estimated noise
% covariance matrices [1].

%% Used By
% This a top-level function that is used directly by the user.

%% See Also
% <dordpo.html |dordpo|>, <dordpi.html |dordpi|>, <dmodpi.html |dmodpi|>,
% <dordrs.html |dordrs|>, <dmodrs.html |dmodrs|>,

%% References
% [1] M. Verheagen, "Identification of the deterministic part of MIMO
% state space models given in innovations form from input-output data",
% _Automatica_, vol. 30, no. 1, pp. 61-74, 1994.
%
% [2] J.M. Maciejowski, "Guaranteed Stability with Subspace Methods",
% Submitted to Systems and Control Letters, 1994.