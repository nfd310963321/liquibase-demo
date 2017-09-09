package com.nongfadai.larva.liquibase;

import liquibase.Contexts;
import liquibase.LabelExpression;
import liquibase.Liquibase;
import liquibase.changelog.ChangeSet;
import liquibase.exception.LiquibaseException;
import org.apache.maven.plugin.logging.Log;

/**
 * @goal update
 */
public class LiquibaseUpdate extends AbstractLiquibaseUpdateMojo {

    /**
     * Whether or not to perform a drop on the database before executing the change.
     *
     * @parameter expression="${liquibase.dropFirst}" default-value="false"
     */
    protected boolean dropFirst;

    @Override
    protected void doUpdate(Liquibase liquibase) throws LiquibaseException {
        if (dropFirst) {
            liquibase.dropAll();
        }
        Log log = getLog();
//        liquibase.getDatabase().exe
        for (ChangeSet changeSet : liquibase.getDatabaseChangeLog().getChangeSets()) {
            log.info("changeSetId:" + changeSet.getId());
            log.info("changeSetId:" + changeSet.generateCheckSum());
        }
        ;
        if (changesToApply > 0) {
            liquibase.update(changesToApply, new Contexts(contexts), new LabelExpression(labels));
        } else {
            liquibase.update(toTag, new Contexts(contexts), new LabelExpression(labels));
        }
    }

    @Override
    protected void printSettings(String indent) {
        super.printSettings(indent);
        getLog().info(indent + "drop first? " + dropFirst);

    }
}