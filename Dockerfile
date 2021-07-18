FROM debian:sid-slim AS multistages_BUILDER
ARG VAR1="testcontent1"
ENV VAR2="testcontent2"
RUN echo "ON multistages_BUILDER 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"
FROM multistages_BUILDER as multistages_BUILD
RUN echo "1 -> ON multistages_BUILD 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"
ARG VAR1="test1"
ENV VAR2="test2"
CMD echo "2 -> ON multistages_BUILD 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"