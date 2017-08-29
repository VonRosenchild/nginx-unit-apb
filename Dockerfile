FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.version"="0.1.0"
LABEL "com.redhat.apb.spec"=\
"bmFtZTogbmdpbngtdW5pdC1hcGIKaW1hZ2U6IG5naW54aW5jL25naW54LXVuaXQtYXBiCmRlc2Ny\
aXB0aW9uOiBOR0lOWCBVbml0IGlzIGFuIGR5bmFtaWMgbXVsdGktbGluZ3VhbCBhcHBsaWNhdGlv\
biBzZXJ2ZXIgZm9yIG1vZGVybiBkaXN0cmlidXRlZCBhcHBsaWNhdGlvbnMuCmJpbmRhYmxlOiBm\
YWxzZQphc3luYzogb3B0aW9uYWwKbWV0YWRhdGE6CiAgZGlzcGxheU5hbWU6IE5HSU5YIFVuaXQK\
ICBsb25nRGVzY3JpcHRpb246IE5HSU5YIFVuaXQgaXMgYW4gZHluYW1pYyBtdWx0aS1saW5ndWFs\
IGFwcGxpY2F0aW9uIHNlcnZlciBmb3IgbW9kZXJuIGRpc3RyaWJ1dGVkIGFwcGxpY2F0aW9ucy4g\
SXQgbGF1bmNoZXMgYXBwbGljYXRpb24gY29kZSBhbmQgcHJvdmlkZXMgYWNjZXNzIHRvIHlvdXIg\
YXBwbGljYXRpb24uCnBsYW5zOgogIC0gbmFtZTogZGVmYXVsdAogICAgZGVzY3JpcHRpb246IFRo\
aXMgZGVmYXVsdCBwbGFuIGRlcGxveXMgTkdJTlggVW5pdAogICAgZnJlZTogdHJ1ZQogICAgbWV0\
YWRhdGE6IHt9CiAgICBwYXJhbWV0ZXJzOgogICAgICAtIG5hbWU6IGNvbmZpZ3VyYXRpb24KICAg\
ICAgICBkZWZhdWx0OiAneyJhcHBsaWNhdGlvbnMiOnsiZXhhbXBsZV9waHAiOnsidHlwZSI6InBo\
cCIsIndvcmtlcnMiOjIsInJvb3QiOiIvc3J2L3NyYyIsImluZGV4IjoiaW5kZXgucGhwIn19LCJs\
aXN0ZW5lcnMiOnsiKjo4MzAwIjp7ImFwcGxpY2F0aW9uIjoiZXhhbXBsZV9waHAifX19JwogICAg\
ICAgIHR5cGU6IHN0cmluZwogICAgICAgIHJlcXVpcmVkOiB0cnVlCiAgICAgICAgdGl0bGU6IE5H\
SU5YIFVuaXQgSlNPTiBQYXlsb2FkCiAgICAgIC0gbmFtZTogcmVwb3NpdG9yeQogICAgICAgIGRl\
ZmF1bHQ6IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tLzdiYjE2MWQyNzFiNzFlMTM5Y2I1ZTYwNmI0\
ZjFhNGI0LmdpdAogICAgICAgIHR5cGU6IHN0cmluZwogICAgICAgIHJlcXVpcmVkOiB0cnVlCiAg\
ICAgICAgdGl0bGU6IEdpdCBSZXBvc2l0b3J5IFVSTAo="

COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
RUN chmod -R g=u /opt/{ansible,apb}
USER apb
