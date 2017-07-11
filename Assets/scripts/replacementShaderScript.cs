using UnityEngine;
using System.Collections;

public class replacementShaderScript : MonoBehaviour {

	public Shader replacemntShader ;
	public bool replace = false;

	void OnEnable() {
		setreplacemnetShader ();
	}

	public void setreplacemnetShader(){
		if(replacemntShader!=null){
			GetComponent<Camera> ().SetReplacementShader (replacemntShader, "RenderType");
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
