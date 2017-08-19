BEGIN {count=0;}; /^de[a-zA-Z]+ed[^a-zA-Z]/ {++count;}; END {print count;}
