<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Pure CSS Bars</title>
<meta name="description"
	content="Pure CSS Bars, a growing bars chart by RGG">
<meta content="chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable = no">
<link rel="stylesheet" href="css/chart.css">
</head>
<body>
	<br>
	<h2 align="center">일일 권장 섭취량 정보</h2>
	<table class="recommandTable" align="center">
		<caption>영양소 별 권장섭취량-성별, 남자, 여자에 대한 정보를 확인하실 수 있습니다.</caption>
		<tr>
			<th>성별</th>
			<th>남자</th>
			<th>여자</th>
		</tr>
		<tr>
			<td>연령(세)</td>
			<td>성인(19 ~ 29)</td>
			<td>성인(19 ~ 29)</td>
		</tr>
		<tr>
			<td>체위기준(kg)</td>
			<td>65.8</td>
			<td>56.3</td>
		</tr>
		<tr>
			<td>에너지(Kcal)</td>
			<td>2,600</td>
			<td>2,100</td>
		</tr>
		<tr>
			<td>단백질(g)</td>
			<td>65</td>
			<td>55</td>
		</tr>
		<tr>
			<td>지방(g)</td>
			<td>43~72</td>
			<td>35~58.3</td>
		</tr>
		<tr>
			<td>탄수화물(g)</td>
			<td>360~460</td>
			<td>290~370</td>
		</tr>
		<tr>
			<td>칼슘(mg)</td>
			<td>750</td>
			<td>650</td>
		</tr>
		<tr>
			<td>나트륨(mg)</td>
			<td>1,500</td>
			<td>1,500</td>
		</tr>
		<tr>
			<td>비타민A(mg RE)</td>
			<td>750</td>
			<td>650</td>
		</tr>
		<tr>
			<td>비타민C(mg)</td>
			<td>100</td>
			<td>100</td>
		</tr>
		<tr>
			<td>인(mg)</td>
			<td>700</td>
			<td>700</td>
		</tr>
		<tr>
			<td>철(mg)</td>
			<td>10</td>
			<td>14</td>
		</tr>
		<tr>
			<td>칼륨(mg)</td>
			<td>3,500</td>
			<td>3,500</td>
		</tr>
		<tr>
			<td>티아민(mg)</td>
			<td>1.2</td>
			<td>1.1</td>
		</tr>
		<tr>
			<td>리보플라빈(mg)</td>
			<td>1.5</td>
			<td>1.2</td>
		</tr>
		<tr>
			<td>니아신(mg NE)</td>
			<td>16</td>
			<td>14</td>
		</tr>
	</table>
	<div class="container">
		<header>
			<h1>
				Pure <strong>CSS</strong> Bars
			</h1>
			<p>...a growing bars chart.</p>
		</header>
		<div class="chart small-font-size">
			<div class="bar bar-60 yellow">
				<div class="face side-0">
					<div class="growing-bar"></div>
				</div>
				<div class="face side-1">
					<div class="growing-bar"></div>
				</div>
				<div class="face top"></div>
				<div class="face floor"></div>
			</div>
			<div class="bar bar-25 red">
				<div class="face side-0">
					<div class="growing-bar"></div>
				</div>
				<div class="face side-1">
					<div class="growing-bar"></div>
				</div>
				<div class="face top"></div>
				<div class="face floor"></div>
			</div>
			<div class="bar bar-35 cyan">
				<div class="face side-0">
					<div class="growing-bar"></div>
				</div>
				<div class="face side-1">
					<div class="growing-bar"></div>
				</div>
				<div class="face top"></div>
				<div class="face floor"></div>
			</div>
			<div class="bar bar-80 lime">
				<div class="face side-0">
					<div class="growing-bar"></div>
				</div>
				<div class="face side-1">
					<div class="growing-bar"></div>
				</div>
				<div class="face top"></div>
				<div class="face floor"></div>
			</div>
		</div>
		<p>
			Enjoy these Pure <em>CSS</em> Bars, crafted with <em>love</em> and
			'ready-to-use'.
		</p>
		<div>
			<input type="radio" name="status" id="status-1" checked>
			<section class="content">
				<article>
					<p>
						The bar dimensions are based on <em>'em' units</em>, you can <em>resize
							them with a simple 'font-size'</em> property :)
					</p>
					<input type="checkbox" id="double-size" />
					<div class="chart small-font-size">
						<div class="bar bar-0 yellow">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
					</div>
					<label for="double-size">Double size</label>
				</article>
			</section>
			<input type="checkbox" id="set-value" name="set-value" /> <input
				type="radio" name="status" id="status-2">
			<section class="content">
				<article>
					<p>
						To set an animated position use the <em>'bar-n' class</em>,
						setting <em>the 'n' class parameter</em> form 1 to 100 values.
					</p>
					<div class="chart small-font-size">
						<div class="bar bar-1 lime">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
						<div class="bar bar-1-1 cyan">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
					</div>
					<label for="set-value">Set value '85'</label>
				</article>
			</section>
			<input type="radio" name="status" id="status-3">
			<section class="content">
				<article>
					<p>
						Each bar is a <em>'flexbox item'</em>, so feel free to add as many
						as you want. Give them a bit of color too, with the custom color
						classes.
					</p>
					<div class="chart small-font-size">
						<div class="bar bar-0 lime">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
						<div class="bar bar-2 cyan">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
						<div class="bar bar-1 red">
							<div class="face side-0">
								<div class="growing-bar"></div>
							</div>
							<div class="face side-1">
								<div class="growing-bar"></div>
							</div>
							<div class="face top"></div>
							<div class="face floor"></div>
						</div>
					</div>
				</article>
			</section>
			<nav class="legend">
				<label for="status-1">Tip 1</label> <label for="status-2">Tip
					2</label> <label for="status-3">Tip 3</label>
			</nav>
		</div>
	</div>
</body>
</html>