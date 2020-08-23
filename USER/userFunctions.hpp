/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class GRAD_USER {
	tag = "grad_user";
    class cbrn {
		file = "USER\functions\cbrn";
		class cbrnStage {};
		class diwakoFog {};
	};
	class acVtol {
		file = "USER\functions\acVtol";
		class teleportToAcAction {};
	};
};