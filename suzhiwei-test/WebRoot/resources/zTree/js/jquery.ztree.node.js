//双击展开或折叠本节点所有子孙节点
function viewOrcloseTree(id,treeNode){
	   var zTree_Menu = $.fn.zTree.getZTreeObj(id); 
 		nodes = zTree_Menu.getSelectedNodes();
 		if(treeNode.open){
			for (var i=0, l=nodes.length; i<l; i++) {
			    zTree_Menu.setting.view.fontCss = {};
			    zTree_Menu.expandNode(nodes[i], true, true, null, true);
			}
 		}else{
			for (var i=0, l=nodes.length; i<l; i++) {
			    zTree_Menu.setting.view.fontCss = {};
			    zTree_Menu.expandNode(nodes[i], false, true, null, true);
			}	
		}
}