function ghpage() {
    SUNDOWN=$HOME/Github/sundown/sundown;
    echo '
body {
    margin: 0;
    padding: 0;
    font-family: 'Helvetica';
}

p, li {
    font-family: 'Georgia';
    font-size: 16px;
    line-height: 140%;
}

#wrap {
    width: 700px;
    margin: 0 auto;
}

.left {
    width: 420px;
    padding-right: 55px;
    float: left;
}

.right {
    width: 225px;
    float: right;
}

.normal {
    clear:both;
}

#footer {
    margin: 50px 0 20px;
}
#footer p {
    text-align: center;
    font-size: 12px;
}
' > style.css;
    MARKDOWN=`$SUNDOWN index.md`;
    HTML=`echo '
<!doctype html>
<html>
<head>
    <title>Honza Pokorny Project</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
</head>
<body>
    <div id="wrap">
    ';
    echo $MARKDOWN;
    echo '
        </div>

        <div id="footer">
            <p>&copy; 2012 - Honza Pokorny - All rights reserved</p>
        </div>

    </div>
</body>
</html>
    '`;


    echo $HTML > index.html;
};

function lt {
    loc=~/Dropbox/Templates/
    if [ $1 ]
    then
        if [ $1 == "simple" ]
        then
            p="$loc"simple.tex
        elif [ $1 == "letter" ]
        then
            p="$loc"letter.tex
        else
            echo "don't know this type"
        fi
        cp $p .
    else
        echo "You need an argument. Either 'simple' or 'letter'."
        return
    fi
}

# git wrapper
# ===========
# git pull and git push should always use the current branch
# git pull will always use --rebase

function git() {

    REAL_GIT=$(which git)
    BRANCH=$($REAL_GIT branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

    # If there is more than one parameter, proceed with normal git
    if [ $# -gt 0 ]
    then
        $REAL_GIT $@
        return
    fi

    # Check if the only argument is "push" or "pull"
    if [ $1 ]
    then
        if [ $1 == "pull" ]
        then
            "$REAL_GIT pull --rebase origin $BRANCH"
        elif [ $1 == "push" ]
        then
            "$REAL_GIT push origin $BRANCH"
        else
            $REAL_GIT
        fi
    else
        $REAL_GIT
    fi
}

# vim:filetype=sh:
