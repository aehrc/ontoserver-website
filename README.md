# ontoserver-website

Turns out nginx deployment fixes the gruesome html source code.


```
docker run -it --rm -d -p 80:80 --name web -v $pwd/site:/usr/share/nginx/html nginx
```

```
docker login ghcr.io


https://docs.simplystatic.com/article/72-how-to-use-the-debugging-mode

https://www.docker.com/blog/how-to-use-the-official-nginx-docker-image/

https://octopus.com/blog/using-nginx-docker-image

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-github-action

https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic


Some updates:

New SimplyStatic version installed: Ontoserver › Plugin Installation — WordPress (csiro.au) https://ontoserver-wp.csiro.au/wp-admin/plugin-install.php?fs_allow_updater_and_dialog=true&tab=plugin-information&plugin=simply-static-pro&section=changelog&TB_iframe=true&width=600&height=800#section-changelog
SimplyStatic says missing PDF files due to user error: ⁠Including pdf files | WordPress.org https://wordpress.org/support/topic/including-pdf-files/#post-17964816


https://make.wordpress.org/cli/handbook/guides/running-commands-remotely/

https://docs.simplystatic.com/article/51-working-with-wp-cli

https://www.html-tidy.org/

https://github.com/htacg/tidy-html5

https://github.com/validator/validator


```
Enter your Webhook URL here and Simply Static will send a POST request after all files are commited to GitHub.
```

http://www.btellez.com/posts/triggering-github-actions-with-webhooks.html


```
curl -X POST https://api.github.com/repos/:owner/:repo/dispatches \
-H 'Accept: application/vnd.github.everest-preview+json' \
-H 'Authorization: token $TOKEN' \
--data '{"event_type": "$CUSTOM_ACTION_NAME"}'
```

Use latin for encoding

       -latin1
              use ISO-8859-1 for both input and output

```
[2024-08-12 02:51:36] [class-ss-url-fetcher.php:119] http_status_code: 301 | content_type: text/html; charset=iso-8859-1
```


Deployment:
https://learn.microsoft.com/en-us/azure/frontdoor/scenario-storage-blobs
https://learn.microsoft.com/en-us/azure/frontdoor/private-link
https://github.com/Azure/terraform/tree/master/quickstart/101-front-door-premium-storage-blobs-private-link

https://learn.microsoft.com/en-gb/azure/frontdoor/front-door-cdn-comparison

https://mikestephenson.me/2023/05/19/using-a-sas-token-from-frontdoor-to-storage/

https://medium.com/data-querying/azure-storage-sharing-access-leveraging-sas-tokens-so-that-your-users-dont-need-credentials-b4988abb0203

https://learn.microsoft.com/en-us/azure/frontdoor/rule-set-server-variables

Create a *stored access policy for a service SAS*. Stored access policies give you the option to *revoke permissions for a service SAS without having to regenerate the storage account keys*. Set the expiration on these very far in the future (or infinite) and make sure it's regularly updated to move it farther into the future. There is a limit of five stored access policies per container.

```
PS C:\Users\sue005> curl "https://ontoserverwebsite.blob.core.windows.net/ontoserverwebsite/index.html?sv=2023-01-03&st=2024-08-15T23%3A28%3A14Z&se=2024-08-16T23%3A28%3A14Z&sr=c&sp=rl&sig=Vwl4j7UG2YCxM0r9GKff2k2%2BWrt18lmpyZHMw5Eg2CM%3D"
```



```
$env:AZCOPY_CRED_TYPE = "Anonymous";
$env:AZCOPY_CONCURRENCY_VALUE = "AUTO";
./azcopy.exe copy "C:\Users\sue005\git\ontoserver-website-devops\site\*" "https://ontoserverwebsite.blob.core.windows.net/$web/?sv=2023-01-03&se=2024-09-19T02%3A20%3A46Z&sr=c&sp=rwl&sig=70cEu54VlmJ8WYVE3SPNxNjDzND54%2FoUAckUE%2BXUo1o%3D" --overwrite=prompt --from-to=LocalBlob --blob-type Detect --follow-symlinks --check-length=true --put-md5 --follow-symlinks --disable-auto-decoding=false --list-of-files "C:\Users\sue005\AppData\Local\Temp\stg-exp-azcopy-a73c11f6-3b43-46e2-8647-a7d31b497ad3.txt" --recursive --log-level=INFO;
$env:AZCOPY_CRED_TYPE = "";
$env:AZCOPY_CONCURRENCY_VALUE = "";
```