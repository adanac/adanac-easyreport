package com.easytoolsoft.easyreport.scheduler;

import java.text.ParseException;
import java.util.List;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.easytoolsoft.easyreport.data.schedule.po.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MailSendTask extends TimerTask {
	private Logger log = LoggerFactory.getLogger(MailSendTask.class);

	@Override
	public void run() {
		List<Task> tasks = TaskUtils.getTasks();
		for (Task task : tasks) {
			try {
				if (isRunnable(task)) {
					TaskUtils.execute(task);
					log.info("执行完成!");
				}
			} catch (Exception ex) {
				log.error(task.getComment(), ex);
			}
		}
	}

	public boolean isRunnable(Task rt) throws ParseException {
		return false;
	}

}
