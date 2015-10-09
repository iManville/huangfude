<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript" src="/common/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet" href="/common/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">

<script type="text/javascript">
SyntaxHighlighter.all();
$("table.syntaxhighlighter").each(function () {
		if (!$(this).hasClass("nogutter")) {
		var $gutter = $($(this).find(".gutter")[0]);
		var $codeLines = $($(this).find(".code .line"));
		$gutter.find(".line").each(function (i) {
			$(this).height($($codeLines[i]).height());
			$($codeLines[i]).height($($codeLines[i]).height());
			});
		}
		});
</script>

