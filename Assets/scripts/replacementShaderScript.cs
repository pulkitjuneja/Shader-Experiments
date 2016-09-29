using UnityEngine;
using System.Collections;

public class replacementShaderScript : MonoBehaviour {

	public Shader replacemntSahder ;
	public bool replace = false;

	void OnEnable() {
		setreplacemnetShader ();
	}

	public void setreplacemnetShader(){
		if(replacemntSahder!=null){
			GetComponent<Camera> ().SetReplacementShader (replacemntSahder, "RenderType");
		}
	}

	void Update() {
		if (Input.GetKeyDown (KeyCode.C)) {
			replace = !replace;
			if (replace) {
				setreplacemnetShader ();
			}
			else{
				GetComponent<Camera> ().ResetReplacementShader ();
			}
		}
	}
}
