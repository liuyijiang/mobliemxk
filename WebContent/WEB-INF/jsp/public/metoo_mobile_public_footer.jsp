<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<div class="navbar navbar-inverse navbar-fixed-bottom" style="opacity: 0.9;">
	<div class="navbar-inner">
		<div class="container" style="text-align:center;">
		    <div class="span12" >
		      <button class="pull-left btn btn-inverse" onclick="loadMore(false,true)"><i class="icon-caret-left"></i></button>
			  <span class="form-inline">
			    <input class="input-mini" id="navpage" type="text" placeholder="去往">
			    <button class="btn btn-inverse" onclick="changepage()">Go</button>
			  </span>
			  <button class="pull-right btn btn-inverse" onclick="loadMore(true,true)"><i class="icon-caret-right"></i></button>
		    </div>
		</div>
	</div>
</div>
