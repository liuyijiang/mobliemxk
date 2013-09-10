package com.mxk.org.common.domain.constant;

public enum MetooModelTypeConstant {

	METOO_MODEL_TYPE_JCMX(){
		public String getString() {
			return "舰船模型";
		}
	},
	METOO_MODEL_TYPE_TKMX(){
		public String getString() {
			return "装甲模型";
		}
	},
	METOO_MODEL_TYPE_ZJMX(){
		public String getString() {
			return "战机模型";
		}
	},
	METOO_MODEL_TYPE_SBMX(){
		public String getString() {
			return "手办模型";
		}
	},
	METOO_MODEL_TYPE_DMMX(){
		public String getString() {
			return "动漫模型";
		}
	},
	METOO_MODEL_TYPE_GDMX(){
		public String getString() {
			return "高达模型";
		}
	},
	METOO_MODEL_TYPE_QTMX(){
		public String getString() {
			return "其他模型";
		}
	},
	METOO_MODEL_TYPE_SYMX(){
		public String getString() {
			return "所有模型";
		}
	};
	
	public abstract String getString();
}
