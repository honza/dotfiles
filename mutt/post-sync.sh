#!/usr/bin/env sh

notmuch new

notmuch tag +gmail -- tag:new and to:pokorny.honza@gmail.com
notmuch tag +pokorny -- tag:new and to:honza@pokorny.ca
notmuch tag +honza -- tag:new and to:me@honza.ca
notmuch tag +wyatt -- tag:new and to:wyatt@pokorny.ca
notmuch tag +redhat -- tag:new and to:honza@redhat.com
notmuch tag +redhat -- tag:new and to:hpokorny@redhat.com

notmuch tag -new -inbox +openstack -- tag:new and to:openstack-dev@lists.openstack.org
notmuch tag -new +inbox +tripleo -- tag:openstack and subject:tripleo
notmuch tag -new -inbox +memo-list -- tag:new and to:memo-list@redhat.com
notmuch tag -new +review -- tag:new and from:review@openstack.org

cd ~/.mail
git add .
git commit -m "more"
cd -
