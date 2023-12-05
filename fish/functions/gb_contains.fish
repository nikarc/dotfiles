function gb_contains
  set COMMIT_ID $argv[1]

  if git merge-base --is-ancestor $COMMIT_ID HEAD
    echo "true"
  else
    echo "false"
  end
end
