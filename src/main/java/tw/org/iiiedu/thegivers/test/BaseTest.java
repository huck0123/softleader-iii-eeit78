package tw.org.iiiedu.thegivers.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring-*.xml"})
@TransactionConfiguration(defaultRollback = false, transactionManager = "transactionManager")
@Transactional
public class BaseTest {
//	protected Logger log = LoggerFactory.getLogger(this.getClass());
}
