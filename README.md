## About RefEx
<p><strong>RefEx (Reference Expression dataset; <a href="http://refex.dbcls.jp">http://refex.dbcls.jp</a>) is a web tool for browsing reference gene expression, which provides access to curated data from several other public databases, with expression levels in forty tissues measured by four well-established gene-expression quantification technologies.</strong> The web interface allows users to browse the expression profiles by the gene name, various types of IDs, chromosomal regions in genetic maps, gene family based on InterPro, gene expression patterns, or biological categories based on Gene Ontology, and to compare expression profiles by different methods at a glance. </p>
<p><strong>RefEx provides suitable datasets as a reference for gene expression data from 40 normal human, mouse, and rat tissues and cells.</strong> Forty tissues were selected based on the experience gained while constructing the <a href="http://dx.doi.org/10.1093/nar/gkj137" target="_blank">bodymap</a> database. The 40 tissues are classified into 10 groups (i.e., brain, blood, connective, reproductive, muscular, alimentary, liver, lung, urinary, and endo/exocrine). These groupings are mainly used for the abstraction of the gene expression profiles in the summary view and the inference of gene functions by the gene expression profiles. The following four different measurement strategies were used in our collected gene expression data: ESTs, Affymetrix GeneChip, CAGE, and RNA-Seq. These four types of data were linked based on the NCBI gene IDs in the dataset in RefEx.</p>

### Table of Contents
- [Rawdata_Processing](https://github.com/hiromasaono/RefEx/tree/master/Rawdata_Processing)
- [Sample_Annotations](https://github.com/hiromasaono/RefEx/tree/master/Sample_Annotations)
- [Processed_Data](https://github.com/hiromasaono/RefEx/tree/master/Processed_Data)

<h2>RefExとは</h2>
	<p>RefEx（Reference Expression dataset）は、遺伝子発現解析の基準となる各遺伝子の遺伝子発現量を簡単に検索、閲覧できるウェブツールです。</p>
	<p>( <a title="http://refex.dbcls.jp/" href="http://refex.dbcls.jp/" target="_blank">http://refex.dbcls.jp/</a> )</p>
	<img src="http://dbcls.rois.ac.jp/wp-content/uploads/2014/05/RefEx1.png" alt="サンプル1" width="300" height="200" hspace="10" align="center"/><img src="http://dbcls.rois.ac.jp/wp-content/uploads/2014/05/RefEx2.png" alt="サンプル2"  width="300" height="200" hspace="10" align="center"/>
<h4>RefExの特徴</h4>
	<ul>
		<li>正常組織・細胞等の遺伝子発現状況を ひと目で</li>
			<ul>
				<li>複数の遺伝子発現計測手法によって得られた哺乳類の正常組織、細胞等における遺伝子発現データを収集し並列に表現することによって、各組織における遺伝子発現状況を計測手法間の差異とともに直感的に比較できることが特長です。RefExを利用することで、研究者は研究対象とする遺伝子が平常時にどの組織、細胞でどの程度発現しているのかについて、自ら実験をすることなく確認することができます。また、研究者がしばしば遭遇する馴染みのない遺伝子について、一般的には個別の研究論文における実験データや記述などからそれらの生物学的特徴を類推したりしますが、RefExでは実験デザインに左右されない大規模かつ網羅的な測定データから研究者自身の目でそれらを簡単に確認することができます。さらに、研究者の用意した複数の遺伝子IDについて一括で検索できる機能を備えているほか、リスト機能を用いて遺伝子の詳細データを並列に比較することができるため、遺伝子発現解析などで見出された遺伝子群の関係性を知るためのツールとしても有用です。</li>
			</ul>
		<li>調べたい遺伝子を より探しやすく よりわかりやすく</li>
			<ul>
				<li>もっとも基本的なキーワード·遺伝子名検索では文字を入力する度に検索語の候補が提示されるので、それらから選択することで容易にキーワード入力を行うことができます。また、「転写因子」や「Gタンパク質共役受容体」、「2番染色体」などのように、ある分類に属する遺伝子群についてまとめて検索·比較できるよう整理されています。さらに、さまざまな実験における比較対照などに用いられる『組織特異的遺伝子』を測定データから独自に算出し、組織ごとに一覧することができます。Advanced searchでは、複雑な検索条件を一度に指定することが可能であり、あらかじめID情報などが手元にある場合には、目的とするデータに簡単に行き着くことができます。</li>
			</ul>
		<li>直感的な可視化で 新たな知識発見・仮説構築を</li>
			<ul>
				<li>検索結果一覧および個別の遺伝子の詳細情報ページでは、組織間の比較と測定手法間（EST、GeneChip、CAGE、RNA-seq）の比較を両立させた相対発現量が棒グラフで示されるとともに人体の3Dモデルである<a href="http://lifesciencedb.jp/bp3d/">BodyParts3D/Anatomography</a>に発現量を反映させたヒートマップが表示されます。またリスト機能を使えば、検索結果の個別の遺伝子について一時的に保存しておくことができます。リストに追加した遺伝子は、最大でその3つについて、40分類の組織·臓器における発現データを比較しながら、遺伝子に付与された機能に関する注釈情報（Gene Ontology他）を見比べることができます。これらの機能は、新たな知識発見あるいは仮説の構築をサポートします。詳細情報ページに記載された種々のIDには、それぞれRefExの内部リンクやオリジナルのデータベースサイトへの外部リンクが貼られており、同じ分類に属する遺伝子を再検索したり、RefEx自体を遺伝子検索の起点とすることもできます。</li>
			</ul>
		<li>再利用可能で有用なパブリックデータの活用例</li>
			<ul>
				<li>RefExが提供するすべてのデータは、クリエイティブ·コモンズライセンスのもとで、オープンデータとして自由にダウンロードおよび再利用することができます。検索結果一覧や詳細情報ページのデータはいずれもダウンロードすることが可能で、研究者自身のデータと参照することも、それらを使った再解析も自由に行うことができます。また、外部の研究データレポジトリ「figshare」にも全てのデータがDOI付きで公開されています（<a href="https://doi.org/10.6084/m9.figshare.c.3812815" target="_blank">https://doi.org/10.6084/m9.figshare.c.3812815</a>）。さらに、ソフトウェア開発プロジェクトのための共有ウェブサービス「GitHub」上にも、公開データの再解析に用いたプログラムやドキュメントを整理しており、RefExで提供する再解析データについてある一定の評価品質および再現性を担保しています（<a href="https://github.com/dbcls/RefEx" target="_blank">https://github.com/dbcls/RefEx</a>）。RefExは生命科学データの共有および再利用の活用例のひとつであり、データ駆動型研究のためのデータセット、ウェブツールとしてだれでも自由に使うことができます。</li>
			</ul>
	</ul>
<h3>利用例</h3>
	<p>
	<ul>
		<li>正常組織や細胞株における遺伝子発現データを調べる｡</li>
		<li>測定手法による遺伝子発現量の違いを比較する｡</li>
		<li>組織特異的に発現する遺伝子をワンタッチで検索可能｡</li>
		<li>遺伝子発現解析などで見出された不詳な遺伝子群の機能および関係性を調べる｡</li>
	</ul>
	<img src="http://dbcls.rois.ac.jp/wp-content/uploads/2014/05/RefEx3.png" alt="サンプル3" width="300" height="200" hspace="10" align="center"/>
	<br clear="left">
	</p>
<h3>今後の開発予定</h3>
	<ul>
		<li>今後は、世界各地で進められている遺伝子発現に関する大規模研究プロジェクト（FANTOM、GTExなど）を中心に、高精度かつ広範囲な遺伝子発現データを収集し、統合することによって、より有用性の高い参照データを作成する予定です。また、それらの参照データを簡単に検索したり、発現データ同士を詳細に比較したりすることを可能にする直感的なウェブインターフェースの開発を進めています。</li>
</ul>
<h3>参考文献</h3>
<ul>
	<li>Hiromasa Ono, Osamu Ogasawara, Kosaku Okubo, Hidemasa Bono
<strong>RefEx, a reference gene expression dataset as a web tool for the functional analysis of genes</strong>
Scientific Data, 4:170105
<a target=_blank href="http://doi.org/10.1038/sdata.2017.105">DOI: 10.1038/sdata.2017.105</a></li>
	<li>川路 英哉、粕川 雄也、坊農 秀雅、小野 浩雅 「FANTOM5データを誰でも活用できる形に」 Scientific Data誌著者インタビュー (平成29年8月29日) 
<a href="https://www.natureasia.com/ja-jp/scientificdata/papers-from-japan/fantom5" target="_blank">https://www.natureasia.com/ja-jp/scientificdata/papers-from-japan/fantom5</a></li>
        <li>小野 浩雅・坊農 秀雅 「遺伝子発現解析の基準となるデータを快適に検索できるウェブツールRefEx」 ライフサイエンス新着論文レビュー (平成29年9月5日) 
<a href="http://doi.org/10.7875/first.author.2017.093" target="_blank">DOI: 10.7875/first.author.2017.093</a></li>
<li>統合TV 「RefExの使い方」<a href="http://doi.org/10.7875/togotv.2014.009" target="_blank">DOI:10.7875/togotv.2014.009</a></li>
</ul>
